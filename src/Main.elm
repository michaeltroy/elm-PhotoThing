import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (..)
import Html.Events exposing (onClick)
import Array exposing (Array)


-- Type alias's


type alias Photo =
  { url : String }


type alias Model =
  { photos : List Photo
  , selectedUrl : String
  , chosenSize : ThumbnailSize
  }


type ThumbnailSize
  = Small
  | Medium
  | Large


type alias Msg =
  { event : String
  , data : String
  }


-- Initial model


initialModel : Model
initialModel =
  { photos =
    [ { url = "picture1.png" }
    , { url = "picture2.png" }
    , { url = "picture3.png" }
    ]
  , selectedUrl = "picture2.png"
  , chosenSize = Small
  }


photoArray : Array Photo
photoArray =
  Array.fromList
    initialModel.photos


getPhotoUrl : Int -> String
getPhotoUrl index =
  case Array.get index photoArray of
    Just photo ->
      photo.url
    Nothing ->
      ""


-- Update


update msg model =
  case msg.event of
    "selectPic" ->
      { model | selectedUrl = msg.data }
    "surpriseMe" ->
      { model | selectedUrl = "picture3.png" }
    _ ->
      model


-- View


urlPrefix : String
urlPrefix =
  "assets/"


viewThumbnail : String -> Photo -> Html Msg
viewThumbnail selectedUrl thumbnail =
    img
      [ src (urlPrefix ++ thumbnail.url)
      , classList [ ("selected", selectedUrl == thumbnail.url ) ]
      , onClick { event = "selectPic", data = thumbnail.url }
      ] []


viewSizeChooser : ThumbnailSize -> Html Msg
viewSizeChooser size =
  label []
    [ input [ type' "radio", name "size" ] []
    , text (sizeToString size)
    ]


sizeToString : ThumbnailSize -> String
sizeToString size =
  case size of
    Small ->
      "small"
    Medium ->
      "medium"
    Large ->
      "large"


view : Model -> Html Msg
view model =
  div [ class "content" ] [
      h1 [] [ text "Photo Thing"]
      , button
        [ onClick { event = "surpriseMe", data = "" } ]
        [ text "Surprise me!" ]
      , h3 [] [ text "Thumbnail Size:" ]
      , div [ id "chosen-size" ]
        (List.map viewSizeChooser [ Small, Medium, Large ])
      , div [ id "thumbnails" ]
        (List.map (viewThumbnail model.selectedUrl)
          model.photos
        )
      , img
        [ class (sizeToString model.chosenSize)
        , src (urlPrefix ++ model.selectedUrl)
        ] []
      ]


-- Main outputs our app


main =
  Html.App.beginnerProgram
    { model = initialModel
    , view = view
    , update = update
    }

