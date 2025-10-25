#!/bin/bash
# ⚙️ Bash Conditional Statements (if, elif, else)
# ----------------------------------------------------------
# This script explains all types of conditions in Bash,
# including numeric, string, and file checks.
# ----------------------------------------------------------

# ----------------------------------------
# ✅ Taking user input
# ----------------------------------------
read -p "Enter your age: " age
echo "Your age is $age"

# ----------------------------------------
# ✅ Basic if-elif-else structure
# ----------------------------------------
# Syntax:
# if [[ condition ]]; then
#     commands
# elif [[ another_condition ]]; then
#     commands
# else
#     commands
# fi

if [[ $age -lt 18 ]]; then
    echo "You are a minor."
elif [[ $age -ge 18 && $age -lt 60 ]]; then
    echo "You are an adult."
else
    echo "You are a senior citizen."
fi


# ----------------------------------------
# ✅ Numeric Comparisons
# ----------------------------------------
# -eq  → equal to
# -ne  → not equal to
# -lt  → less than
# -le  → less than or equal to
# -gt  → greater than
# -ge  → greater than or equal to

echo -e "\n------------------ Numeric Comparisons ------------------"
num1=10
num2=20

if [[ $num1 -eq $num2 ]]; then
    echo "$num1 is equal to $num2"
elif [[ $num1 -lt $num2 ]]; then
    echo "$num1 is less than $num2"
else
    echo "$num1 is greater than $num2"
fi


# ----------------------------------------
# ✅ String Comparisons
# ----------------------------------------
# =   → equal
# !=  → not equal
# <   → less than (alphabetically)
# >   → greater than (alphabetically)
# -z  → string is empty
# -n  → string is not empty

echo -e "\n------------------ String Comparisons ------------------"
read -p "Enter your name: " name

if [[ -z "$name" ]]; then
    echo "You didn't enter a name!"
elif [[ "$name" = "Alice" ]]; then
    echo "Hello Alice!"
elif [[ "$name" != "Alice" ]]; then
    echo "You're not Alice."
fi


# ----------------------------------------
# ✅ Logical Operators
# ----------------------------------------
# && → AND
# || → OR
# !  → NOT

echo -e "\n------------------ Logical Operators ------------------"
marks=85
attendance=90

if [[ $marks -ge 80 && $attendance -ge 75 ]]; then
    echo "You passed with good performance!"
elif [[ $marks -ge 50 || $attendance -ge 50 ]]; then
    echo "You barely passed!"
else
    echo "You failed!"
fi


# ----------------------------------------
# ✅ File Test Operators
# ----------------------------------------
# -e  → file exists
# -f  → file is a regular file
# -d  → directory exists
# -r  → file is readable
# -w  → file is writable
# -x  → file is executable
# -s  → file is not empty

echo -e "\n------------------ File Test Operators ------------------"
read -p "Enter a file or directory name: " path

if [[ -e $path ]]; then
    echo "✅ '$path' exists."
    if [[ -d $path ]]; then
        echo "📁 It is a directory."
    elif [[ -f $path ]]; then
        echo "📄 It is a regular file."
    fi
    [[ -r $path ]] && echo "🔹 It is readable."
    [[ -w $path ]] && echo "🔹 It is writable."
    [[ -x $path ]] && echo "🔹 It is executable."
else
    echo "❌ '$path' does not exist."
fi


# ----------------------------------------
# ✅ Case Statement (alternative to multiple ifs)
# ----------------------------------------
# Syntax:
# case $variable in
#   pattern1) commands ;;
#   pattern2) commands ;;
#   *) default ;;
# esac

echo -e "\n------------------ Case Statement ------------------"
read -p "Enter a letter (a/b/c): " letter

case $letter in
    a|A)
        echo "You chose A"
        ;;
    b|B)
        echo "You chose B"
        ;;
    c|C)
        echo "You chose C"
        ;;
    *)
        echo "Invalid choice!"
        ;;
esac


# ----------------------------------------
# ✅ Nested Conditions Example
# ----------------------------------------
echo -e "\n------------------ Nested Conditions ------------------"
read -p "Enter your score (0-100): " score

if [[ $score -ge 0 && $score -le 100 ]]; then
    if [[ $score -ge 90 ]]; then
        echo "Grade: A"
    elif [[ $score -ge 75 ]]; then
        echo "Grade: B"
    elif [[ $score -ge 50 ]]; then
        echo "Grade: C"
    else
        echo "Grade: F"
    fi
else
    echo "Invalid score! Must be between 0 and 100."
fi


# ----------------------------------------
# 🧠 Quick Bash Conditional Concepts Recap
# ----------------------------------------
# 🧩 Basic structure:
#   if [[ condition ]]; then ... fi
# 🧮 Numeric tests:
#   -eq, -ne, -lt, -le, -gt, -ge
# 🔤 String tests:
#   =, !=, <, >, -z, -n
# ⚙️ Logical:
#   && (AND), || (OR), ! (NOT)
# 📁 File tests:
#   -e, -f, -d, -r, -w, -x, -s
# 🗂️ Case statement:
#   A cleaner way to handle multiple choices

echo -e "\n✅ Conditional examples completed successfully!"
