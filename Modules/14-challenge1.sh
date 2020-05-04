#!/usr/bin/env bash

read -p 'Enter the value : ' value

while [ $value -le 0 ]; do
  echo "$value"
  value=$(($value-1))
  exit;
  done