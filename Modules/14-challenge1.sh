#!/usr/bin/env bash


read -p 'Enter the value : ' value

while [ $value -gt 0 ]; do
 i=$value
 j=1
  while [ $j -lt $i ]; do
    echo -n "$j  "
        i=$(($j+1))
  done|
  value=$(($value-1))
done|tac