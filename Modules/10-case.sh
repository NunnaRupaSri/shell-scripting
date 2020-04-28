#syntax of case commands
<<EOF
case var in
patt) command ;;
patt1) command ;;
esac
EOF

# Syntax Oberation
#"Var" is variable, the data in a variable will be change with all the parttens given below.
# if 'var' data is equal to 'patt'  then command inside 'patt' will be executed.
# ;; is a part of syntax telling to case that you will done with your commands.

read -p 'Enter Course Name : ' course
case $course in
 aws)
  echo "Welcome to the Traning"
  echo "Avilable course timings are 10AM"
  ;;
 devops)
  echo "Welcome to the Traning"
  echo "Avilable course timings are 07PM"
  ;;
 *)
   echo "Invalid course name!!! Avilable course are aws & devops"
esac