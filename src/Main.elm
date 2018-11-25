module Main exposing (main)

import Browser
import Html exposing (Html, text)


type alias Model =
    String


type Msg
    = Hello


init : () -> ( Model, Cmd Msg )
init _ =
    ( "Hello", Cmd.none )


view : Model -> Html Msg
view model =
    Html.div [] [ text model ]


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
