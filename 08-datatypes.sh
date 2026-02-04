#!/bin/bash

NUM1=1000
NUM2=200

SUM=$(($NUM1+$NUM2))

echo "Sum is $SUM"

FRUITS=("Apple" "Banana" "Sapota")

echo "Fruits are: ${FRUITS[@]}"

echo "First fruit is: ${FRUITS[0]}"
echo "Second fruit is: ${FRUITS[1]}"
echo "Third fruit is: ${FRUITS[2]}"