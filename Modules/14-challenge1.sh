#!/usr/bin/env bash

read -p 'Enter the value : ' value

i=$value
while [ $value -gt 0 ]; do
  while [ $i -gt 0 ]; do
    echo "$i"
    i=$(($i-1))
    done
  echo "$value"
  value=$(($value-1))
done