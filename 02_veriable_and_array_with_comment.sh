#!/bin/bash   # Shebang line – tells the system to use the bash shell to interpret this script.

# ---------------------------
# Define name and email variables
# ---------------------------
name="Sishir Siam"                         # Assign the string "Sishir Siam" to the variable 'name'
email="shishir.siam01@gmail.com"          # Assign the string email to the variable 'email'

echo "My name is $name"                   # Print the value of the 'name' variable
                                          # ${var}: Accesses variable value
echo "My email is $email"

# ---------------------------
# Add some line spacing
# ---------------------------
echo -e "\n\n"                             # Print two newlines using escape sequence
echo -e "\n\n"

# ---------------------------
# Define and use an array
# ---------------------------
myArray=(15 "May" 2004 "Sishir" "Siam" "Shishir Siam" "Tushar" "Raj" "Megh" "Shanto")  
# Create an array with mixed data: integers and strings

echo "'${myArray[3]} ${myArray[4]}' BirthDay is '${myArray[0]} ${myArray[1]} ${myArray[2]}'."  
# Access individual elements using indices: ${array[index]}

echo "Full Array: ${myArray[*]}"          # [*]: Gets all elements of an array as a single word
                                          # [@]: Also gets all elements, but preserves spacing when quoted
                                          
echo "Slice Array: ${myArray[*]:3:5}"     # [:start:length]: Slice syntax for arrays

# ---------------------------
# Find array length
# ---------------------------
lenOfArray=${#myArray[@]}                 # #array[@]: Gives the total number of elements in the array
echo "Length of Array: $lenOfArray"



<<comments
🧠 Quick Bash Concepts Recap:
    - ${var}: Accesses variable value
    - [*]: Gets all elements of an array
    - [@]: Also used to get all elements (more useful when elements contain spaces)
    - [:start:length]: Slice syntax for arrays
    - #array[@]: Gives the total number of elements
comments