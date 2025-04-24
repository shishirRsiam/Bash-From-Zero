#!/bin/bash   # Shebang line – tells the system to use the Bash shell to run this script.

# -----------------------------------------
# ✅ String Operations
# -----------------------------------------

# String Assignment
str="Hello, My Name is Sishir Siam. I am a Software Engineer. I am from Bangladesh. I am 21 years old."  # Define a string

echo "-----------------------------------------"
# -----------------------------------------
# ✅ String Length
# -----------------------------------------
echo "String Length: ${#str}"              # ${#str}: Returns the length of the string 'str'
echo "String Length: $(expr length "$str")"  # Using `expr length` to calculate string length
echo "Full String: ${str}"                 # Print the full content of the string
echo "-----------------------------------------"

# -----------------------------------------
# ✅ String Case Conversion
# -----------------------------------------
echo "Uppercase: ${str^^}"   # ${str^^}: Converts all characters in the string to uppercase
echo "Lowercase: ${str,,}"   # ${str,,}: Converts all characters in the string to lowercase
echo "-----------------------------------------"

# -----------------------------------------
# ✅ String Substring Extraction
# -----------------------------------------
echo "Substring (from index 0, length 5): ${str:0:5}"  # ${str:start:length}: Extracts a substring from the string starting at index 0, with length 5

# -----------------------------------------
# ✅ String Replacement
# -----------------------------------------
echo "Replace 'Sishir' with 'Shishir': ${str//Sishir/Shishir}"   # ${str//old/new}: Replace all occurrences of 'old' with 'new'

# -----------------------------------------
# ✅ String Indexing (Find position of a substring)
# -----------------------------------------
echo "Index of 'Engineer': $(expr index "$str" "Engineer")"  # `expr index`: Finds the index of the first occurrence of a substring

# -----------------------------------------
# ✅ String Trimming (Remove spaces from both ends)
# -----------------------------------------
trimmed_str="${str%"${str##*[![:space:]]}"}"  # Remove trailing spaces
trimmed_str="${trimmed_str%"${trimmed_str##*[![:space:]]}"}"  # Remove leading spaces
echo "Trimmed String: '$trimmed_str'"   # Show the trimmed string

echo "-----------------------------------------"



<<Recap
🧠 Recap:
    - ${#str}: Gets the length of the string
    - expr length "$str": Another way to get the string length using `expr`
    - ${str}: Prints the full content of the string
    - ${str^^}: Converts all characters to uppercase
    - ${str,,}: Converts all characters to lowercase
    - ${str:start:length}: Extracts a substring from the string
    - ${str//old/new}: Replaces all occurrences of 'old' with 'new' in the string
    - expr index "$str" "substring": Finds the index of the first occurrence of 'substring' in the string
    - String trimming: Removes spaces from both ends of the string using pattern matching
Recap
