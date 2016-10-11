import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)


-- View


view model =
  div [ class "content" ]
      [ h1 [] [ text "Photo Thing"]
      , div [ id "thumbnails" ]
        [ img [ src "assets/nature.png" ] []
        , img [ src "assets/nature.png" ] []
        , img [ src "assets/nature.png" ] []
        ]
      ]


-- Main


main =
  view "no model yet"

