#!/usr/bin/env bash
# for loop is going to deal with a list of items
ITEMS="shipping user cart"

for items in $ITEMS ; do
  echo "Restarting service $ITEM"
  systemctl restart $item
done
