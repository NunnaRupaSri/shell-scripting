#!/usr/bin/env bash
# for loop is going to deal with a list of items
ITEMS="shipping user cart"

for items in $ITEMS ; do
  echo "Restarting service $ITEMS"
  systemctl restart $item
done
