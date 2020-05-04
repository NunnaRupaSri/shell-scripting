#!/usr/bin/env bash

read -p 'Enter the value : ' value

while [ $value -le 0 ]; do
 i=$value
  while [ $i -le 0 ]; do
    echo -n  "$i  "
        i=$(($i+1))
  done
  echo
  value=$(($value+1))
done