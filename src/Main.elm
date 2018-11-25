module Main exposing (main)

import Browser
import Helpers
import Html exposing (Html, div, hr, input, text)
import Html.Attributes exposing (disabled, max, min, type_, value)
import Html.Events exposing (onInput)


type alias Model =
    { work : Int
    }


type Msg
    = ChangeMoney String


init : () -> ( Model, Cmd Msg )
init _ =
    ( { work = 0
      }
    , Cmd.none
    )


viewValue : String -> (Int -> Int) -> Int -> Html Msg
viewValue label getValue work =
    div []
        [ div [] [ text label ]
        , input
            [ type_ "range"
            , disabled True
            , value (String.fromInt (getValue work))
            ]
            []
        ]


view : Model -> Html Msg
view model =
    div []
        [ input
            [ type_ "range"
            , min "0"
            , max "100"
            , value (String.fromInt model.work)
            , onInput ChangeMoney
            ]
            []
        , hr [] []
        , viewValue "money stress" Helpers.moneyStress model.work
        , viewValue "job stress" Helpers.jobStress model.work
        , viewValue "free time" Helpers.freeTime model.work
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
                        | work = val
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
