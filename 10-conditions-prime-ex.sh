#!/bin/bash

echo "Enter a number:"
read num
# Prime check
for (( i=2; i<num; i++ ))
do
    if (( num % i == 0 )); then 
        echo "The number $num is not prime"
        exit 0
    fi
done