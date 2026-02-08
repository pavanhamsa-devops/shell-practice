#!/bin/bash

count=1
while [ $count -le 5 ]
do
    echo "count is: $count"
    sleep 1
    ((count++))
done