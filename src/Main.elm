import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (..)
import Html.Events exposing (onClick)
import Array exposing (Array)
import Random
import String


-- Type alias'


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


type Msg
  = SelectByUrl String
  | SelectByIndex Int
  | SurpriseMe
  | SetSize ThumbnailSize


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


randomPhotoPicker : Random.Generator Int
randomPhotoPicker =
  Random.int 0 (Array.length photoArray - 1 )


-- view


urlPrefix : String
urlPrefix =
  "assets/"


viewThumbnail : String -> Photo -> Html Msg
viewThumbnail selectedUrl thumbnail =
    img
      [ src (urlPrefix ++ thumbnail.url)
      , classList [ ("selected", selectedUrl == thumbnail.url ) ]
      , onClick (SelectByUrl thumbnail.url)
      ] []


viewSizeChooser : ThumbnailSize -> Html Msg
viewSizeChooser size =
  label []
    [ input [ type' "radio", name "size"
    , onClick (SetSize size) ] []
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
      p [] [ text (toString model)  ]
      , h1 [] [ text "Photo Thing"]
      , button
        [ onClick SurpriseMe ]
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


-- Update


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SelectByIndex index ->
      ( { model | selectedUrl = getPhotoUrl index }, Cmd.none )
    SelectByUrl url ->
      ( { model | selectedUrl = url }, Cmd.none )
    SurpriseMe ->
      ( model, Random.generate SelectByIndex randomPhotoPicker )
    SetSize size ->
      ( { model | chosenSize = size }, Cmd.none )


-- Main outputs our app


main : program Never
main =
  Html.App.program
    { init = (initialModel, Cmd.none )
    , view = view
    , update = update
    , subscriptions = (\model -> Sub.none)
    }

