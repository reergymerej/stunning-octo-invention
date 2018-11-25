module Main exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (max, min, type_, value)
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


jobStress : Int -> Int
jobStress work =
    work


moneyStress : Int -> Int
moneyStress work =
    100 - work


freeTime : Int -> Int
freeTime work =
    100 - (abs (50 - work) * 2)


viewValue : String -> (Int -> Int) -> Int -> Html Msg
viewValue label getValue work =
    div [] [ text (label ++ ": " ++ String.fromInt (getValue work)) ]


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
        , viewValue "work" (\x -> x) model.work
        , viewValue "job stress" jobStress model.work
        , viewValue "money stress" moneyStress model.work
        , viewValue "free time" freeTime model.work
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
