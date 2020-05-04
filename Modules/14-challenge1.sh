#!/usr/bin/env bash

read -p 'Enter the value : ' value

while [ $value -gt 0 ]; do
 i=$value
  while [ $i -gt 0 ]; do
    echo -n -t "$i"
        i=$(($i-1))
  done
  value=$(($value-1))
done