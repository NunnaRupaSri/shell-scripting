# Asign a name to set of command, then it is called a function
# EX: function sample() {
# command1
# command2
# }

# FUNCTION
sample() {
  echo Hello i am from function
  echo value of a in function = $a
  b=20
  local c=30
}
sample1() {
  echo line in sample1
  return  # Smiliar like exit command.
  echo line in sample2
}
# MAIN PROGRAM
a=10
sample
echo value of b in Main program = $b
echo value of c in Main program = $c
sample1
echo "End of the Program"
# Function are always to be written before Main Program.
# Variable form main program can be accesed in function.
# Variable from function can be accesed in Main Program.
# Any variable declare inside a function with "local", those cannot be accessed in Main Program
# "exit" command in fuction will bring out of script but not out of function.
# to come out of the function we use "return" command