module PhotoThing exposing (..)

import Html exposing (..)
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


-- Initial model

initialModel =
    [ { url = "assets/nature.png" }
    , { url = "assets/nature.png" }
    , { url = "assets/nature.png" }
    ]


main =
  view initialModel
