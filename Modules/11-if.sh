#!/usr/bin/env bash
<<EOF


If is usually seen in three forms.
1. Simpel-IF
  if [ experssion ]; then
    commands   <-- if experssion true execute these commands
  fi


2. IF-Else
  if [ experssion ]; then
     commands <-- if experssion true execute these commands
   else [ experssion ]; then
     commands <-- if experssion false execute these commands
  fi

3. Else-IF
   if [ experssion ]; then
      commands <-- if experssion true execute these commands, if it fails it checks for next expression
    elif [ experssion ]; then
      commands
   fi

EOF


<<EOF
# Expression
Expression are categorized as 1.string Operators 2.Numerical Operators 3.File Operators
https://linux.die.net/man/1/bash
EOF



a=10
if [ $a -gt 0 ]; then
  echo "value of a is greater than 0"
  else
    echo "value of a is less than 0"
fi

read -p 'Enter the course name : ' course

if [ $course = aws ]; then
  echo "AWS Course"
  elif [ $course = Devops ]; then
    echo "Devops Course"
  else
    echo "Available course are AWS & Devops!! Choose one of them"
    exit 1
fi