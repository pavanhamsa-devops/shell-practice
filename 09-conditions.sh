#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]; then
    echo "Given number: is greater then 20"
else
    echo "Given number: is lesser than 20"
fi