#!/usr/bin/env bash

read -p 'Enter the value : ' value

while [ $value -ge 5 ]; do
 i=$value
  while [ $i -ge 5 ]; do
    echo -n  "$i  "
        i=$(($i+1))
  done
  echo
  value=$(($value+1))
done