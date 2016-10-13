import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (..)
import Html.Events exposing (onClick)
import Array exposing (Array)
-- import PhotoThing exposing (main)


-- Type alias's


type alias Photo =
  { url : String }


type alias Model =
  { photos : List Photo
  , selectedUrl : String
  }


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
  }


photoArray : Array Photo
photoArray =
  Array.fromList
    initialModel.photos


-- Update


update msg model =
  if msg.event == "selectPic" then
    { model | selectedUrl = msg.data }
  else
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


view : Model -> Html Msg
view model =
  div [ class "content" ] [
      h1 [] [ text "Photo Thing"]
      , div [ id "thumbnails" ]
        (List.map (viewThumbnail model.selectedUrl)
          model.photos
        )
      , img
        [ class "large"
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

