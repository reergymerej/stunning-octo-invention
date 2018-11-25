module Main exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (max, min, type_, value)
import Html.Events exposing (onInput)


type alias Model =
    { message : String
    , money : Int
    }


type Msg
    = ChangeMoney String


init : () -> ( Model, Cmd Msg )
init _ =
    ( { message = "Hello"
      , money = 0
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.message ]
        , input
            [ type_ "range"
            , min "0"
            , max "100"
            , value (String.fromInt model.money)
            , onInput ChangeMoney
            ]
            []
        , div [] [ text ("$: " ++ String.fromInt model.money) ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeMoney str ->
            case String.toInt str of
                Nothing ->
                    ( model, Cmd.none )

                Just val ->
                    ( { model
                        | money = val
                      }
                    , Cmd.none
                    )


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
