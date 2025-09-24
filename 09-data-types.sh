#!/bin/bash

NUMBER1=100
NUMBER2=200
NAME=DEVOPS

SUM=$(($NUMBER1 + $NUMBER2 + $NAME))

echo "SUM is: $SUM"

LEADERS=("MODI" "TRUMP" "PUTIN" "XI")

echo "All leaders: ${LEADERS[@]}"
echo "First leader: ${LEADERS[0]}"
echo "Leader at 10th place: ${LEADERS[10]}"
