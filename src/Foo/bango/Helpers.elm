module Foo.Bango.Helpers exposing (freeTime, jobStress, moneyStress)


jobStress : Int -> Int
jobStress work =
    work


moneyStress : Int -> Int
moneyStress work =
    100 - work


freeTime : Int -> Int
freeTime work =
    100 - (abs (50 - work) * 2)
