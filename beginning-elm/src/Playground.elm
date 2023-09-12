{-
   The Playground module is used to experiment with
   various concepts in Elm programming language.
 -}
module Playground exposing (main)

import Html
import Regex

escapeEarth myVelocity mySpeed fuelStatus=
    let
        escapeVelocityInKmPerSec =
            11.86

        orbitalSpeedInKmPerSec =
            7.86

        whereToLand =
            if fuelStatus == "low" then
                "Land on droneship"
            else
                "Land on launchpad"
    in
    if myVelocity > escapeVelocityInKmPerSec then
        "Godspeed"
    else if mySpeed == orbitalSpeedInKmPerSec then
        "Stay in orbit"
    else
        whereToLand

computeSpeed distance time =
    distance / time

computeTime startTime endTime =
    endTime - startTime

add a b =
    a + b

multiply c d =
    c * d

divide e f =
    e / f

weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"
        1 ->
            "Monday"
        2 ->
            "Tuesday"
        3 ->
            "Wednesday"
        4 ->
            "Thursday"
        5 ->
            "Friday"
        6 ->
            "Saturday"
        _ ->
            "Unknown day"


descending a b =
    case compare a b of
        LT ->
            GT
        GT ->
            LT
        EQ ->
            EQ


validateEmail email =
    let
        emailPattern =
            "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

        regex =
            Maybe.withDefault Regex.never <|
                Regex.fromString emailPattern

        isValid =
            Regex.contains regex email
    in
    if isValid then
        ( "Valid email", "green" )
    else
        ( "Invalid email", "red" )


multiplyByFive number =
    let
        multiplier =
            5
    in
    number * multiplier


scoreMultiplier =
    2


hightestScores =
    [ 316, 320, 312, 370, 337, 318, 314 ]


doubleScores scores =
    List.map (\x -> x * scoreMultiplier) scores


main =
    doubleScores hightestScores
        |> Debug.toString
        |> Html.text
