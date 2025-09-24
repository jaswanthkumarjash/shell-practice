#!/bin/bash

start_time=$(date +%s)

sleep 10

end_time=$(date +%s)


Total_time=$(($end_time - $start_time))

echo "total time to get executed is $Total_time seconds"