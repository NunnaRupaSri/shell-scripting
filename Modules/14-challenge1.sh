#!/usr/bin/env bash

read -p 'Enter the value : ' value

while [ $value -ge 0 ]; do
  echo $value
  value=$(($value-1))
  done