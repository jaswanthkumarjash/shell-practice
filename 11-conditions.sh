#!/bin/bash

echo "Please enter number"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "Given number $NUMBER is even"
else
    echo "Given number $NUMBER is odd"
fi