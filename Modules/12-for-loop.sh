#!/usr/bin/env bash
# for loop is going to deal with a list of items
ITEMS="shipping user cart"

for item in $ITEMS ; do
  echo "Restarting service $item"
  systemctl restart $item
done
