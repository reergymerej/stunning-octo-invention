module Main exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (max, min, type_, value)
import Html.Events exposing (onInput)


type alias Model =
    { money : Int
    }


type Msg
    = ChangeMoney String


init : () -> ( Model, Cmd Msg )
init _ =
    ( { money = 0
      }
    , Cmd.none
    )


jobStress : Int -> Int
jobStress money =
    money


moneyStress : Int -> Int
moneyStress money =
    100 - money


view : Model -> Html Msg
view model =
    div []
        [ input
            [ type_ "range"
            , min "0"
            , max "100"
            , value (String.fromInt model.money)
            , onInput ChangeMoney
            ]
            []
        , div [] [ text ("$: " ++ String.fromInt model.money) ]
        , div [] [ text ("job stress: " ++ String.fromInt (jobStress model.money)) ]
        , div [] [ text ("money stress: " ++ String.fromInt (moneyStress model.money)) ]
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
