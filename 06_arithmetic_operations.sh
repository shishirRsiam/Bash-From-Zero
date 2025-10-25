#!/bin/bash

# ============================================================
# 🧮 Bash Maths Operations Script
# ============================================================


# ----------------------------------------
# ✅ Taking user input
# ----------------------------------------
read -p "Enter first number: " num1
read -p "Enter second number: " num2

echo -e "\nFirst number: $num1"
echo "Second number: $num2"


# ----------------------------------------
# ✅ Basic Arithmetic Operations
# ----------------------------------------
echo -e "\n------------------ Basic Arithmetic ------------------"

sum=$((num1 + num2))          # Addition
sub=$((num1 - num2))          # Subtraction
mul=$((num1 * num2))          # Multiplication
div=$((num1 / num2))          # Division (integer division)
mod=$((num1 % num2))          # Modulus (remainder)

echo "Addition: $num1 + $num2 = $sum"
echo "Subtraction: $num1 - $num2 = $sub"
echo "Multiplication: $num1 * $num2 = $mul"
echo "Division: $num1 / $num2 = $div"
echo "Modulus: $num1 % $num2 = $mod"


# ----------------------------------------
# ✅ Floating Point Operations (bc command)
# ----------------------------------------
echo -e "\n------------------ Floating Point ------------------"
sum_float=$(echo "$num1 + $num2" | bc)
div_float=$(echo "scale=2; $num1 / $num2" | bc)
sqrt_num1=$(echo "scale=3; sqrt($num1)" | bc)
power=$(echo "$num1 ^ $num2" | bc)

echo "Floating Sum: $sum_float"
echo "Division (2 decimal places): $div_float"
echo "Square root of $num1: $sqrt_num1"
echo "$num1 raised to the power of $num2: $power"


# ----------------------------------------
# ✅ Increment and Decrement
# ----------------------------------------
echo -e "\n------------------ Increment & Decrement ------------------"

num=$num1
((num++))   # Increment
echo "After increment: $num"

((num--))   # Decrement
echo "After decrement: $num"


# ----------------------------------------
# ✅ Compound Assignments
# ----------------------------------------
echo -e "\n------------------ Compound Assignments ------------------"

temp=$num1
((temp += num2))     # Add and assign
echo "$num1 += $num2 → $temp"

temp=$num1
((temp *= num2))     # Multiply and assign
echo "$num1 *= $num2 → $temp"


# ----------------------------------------
# ✅ Comparison Operations
# ----------------------------------------
echo -e "\n------------------ Comparison Operators ------------------"

if (( num1 > num2 )); then
    echo "$num1 is greater than $num2"
elif (( num1 < num2 )); then
    echo "$num1 is less than $num2"
else
    echo "$num1 is equal to $num2"
fi


# ----------------------------------------
# ✅ Advanced Math with bc
# ----------------------------------------
echo -e "\n------------------ Advanced Math ------------------"
echo "Sine of $num1 (radians): $(echo "s($num1)" | bc -l)"
echo "Cosine of $num1 (radians): $(echo "c($num1)" | bc -l)"
echo "Logarithm (natural log) of $num1: $(echo "l($num1)" | bc -l)"
echo "Exponential (e^$num1): $(echo "e($num1)" | bc -l)"


# ----------------------------------------
# ✅ Summary
# ----------------------------------------
echo -e "\n------------------ Summary ------------------"
echo "Sum: $sum | Sub: $sub | Mul: $mul | Div: $div | Mod: $mod"
echo "Float Div: $div_float | Power: $power | Sqrt: $sqrt_num1"
echo "Comparison: $(if (( num1 == num2 )); then echo "Equal"; elif (( num1 > num2 )); then echo "Greater"; else echo "Smaller"; fi)"
echo -e "-------------------------------------------------\n"


# ----------------------------------------
# 🧠 Quick Bash Maths Recap
# ----------------------------------------
# $((expression))       → Integer arithmetic
# $(echo "expr" | bc)   → Floating-point & advanced math
# ((var += val))        → Compound arithmetic assignment
# ((var++)) / ((var--)) → Increment / Decrement
# ${#var}               → String length (not math but useful)
# Comparison:
#   -eq (==), -ne (!=), -gt (>), -lt (<), -ge (>=), -le (<=)
# bc supports:
#   sqrt(x), s(x), c(x), l(x), e(x), ^ (power), scale=precision
