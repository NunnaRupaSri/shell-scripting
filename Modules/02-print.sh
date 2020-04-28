#!/usr/bin/env bash

echo hello world
echo hello
echo world
echo hello\nworld
echo "hello\nworld"
echo -e "hello\nworld"
echo -e "hello\tworld"
echo -e "hello\n\tworld"
echo -e "hello\n\t\bworld"
# \n Print a new line
# \t print a tab space
# \e print a text in colour
# syntax to eable colour is \e[COLm
# Example: echo -e "\e[COLmHELLO"
#colour      Foreground       background
#Red            31                41
#Green          32                42
#Yellow         33                43
#Blue           34                44
#Magenta        35                45
#Cyan           36                46

echo -e "\e[31m I am Rupa\e[0m"

echo -e "I am" "\e[32m Rupa"
