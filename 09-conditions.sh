#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]; then
    echo "Given number:$NUMBER is greater then 20"
elif [ $NUMBER -eq 20 ]; then
    echo "Given number:$NUMBER is equals to 20"
else
    echo "Given number:$NUMBER is lesser than 20"
fi