#!/bin/bash

NUMBER1=100
NUMBER2=200
FNAME="JASWANTH "
LNAME="KUMAR"


SUM=$(($NUMBER1 + $NUMBER2))
NAME=$FNAME$LNAME #to concatenate two strings.


echo "SUM is: $SUM"

echo "FULL NAME is: $NAME"

LEADERS=("MODI" "TRUMP" "PUTIN" "XI")

echo "All leaders: ${LEADERS[@]}"
echo "First leader: ${LEADERS[0]}"
echo "Leader at 10th place: ${LEADERS[10]}"
