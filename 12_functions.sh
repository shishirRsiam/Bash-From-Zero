#!/bin/bash

# ======================================================
# 💡 Bash Functions Demo
# ======================================================
# This file contains examples of Bash functions:
# - Basic function
# - Arguments and defaults
# - Return values
# - Local vs global variables
# - Loops and multiple arguments
# - Recursion
# - Error handling
# - Arrays
# - System updater
# ======================================================

# -------------------------------
# 1️⃣ Basic Function
# -------------------------------
greet_basic() {
    echo "Hello World!"
}

# -------------------------------
# 2️⃣ Function with Arguments
# -------------------------------
hello() {
    if [[ -z "$1" ]]; then
        echo "❌ You must provide a name!"
        return 1
    fi
    echo "Hello $1"
}

# -------------------------------
# 3️⃣ Function with Default Argument
# -------------------------------
greet_default() {
    local name="${1:-Guest}"  # Default to "Guest" if no argument
    echo "Hello $name"
}

# -------------------------------
# 4️⃣ Function with Return Values
# -------------------------------
add() {
    local sum=$(( $1 + $2 ))
    echo $sum   # return value via echo
}

# -------------------------------
# 5️⃣ Local vs Global Variables
# -------------------------------
var="global_var"

test_scope() {
    local var="local_var"
    echo "Inside function: $var"
}

# -------------------------------
# 6️⃣ Function with Multiple Arguments & Loops
# -------------------------------
greet_all() {
    for name in "$@"; do
        echo "Hello $name"
    done
}

# -------------------------------
# 7️⃣ Recursive Function (Factorial)
# -------------------------------
factorial() {
    local n=$1
    if [[ $n -le 1 ]]; then
        echo 1
    else
        local prev=$(factorial $((n-1)))
        echo $(( n * prev ))
    fi
}

# -------------------------------
# 8️⃣ Error Handling
# -------------------------------
safe_divide() {
    if [[ $2 -eq 0 ]]; then
        echo "❌ Error: division by zero"
        return 1
    fi
    echo $(( $1 / $2 ))
}

# -------------------------------
# 9️⃣ Functions Returning Arrays
# -------------------------------
get_even_numbers() {
    local arr=()
    for i in $(seq 1 $1); do
        (( i % 2 == 0 )) && arr+=($i)
    done
    echo "${arr[@]}"
}

# -------------------------------
# 🔟 Optimized Kali System Updater
# -------------------------------
update_kali() {
    echo -e "\033[1;34m🔄 Starting system update...\033[0m"
    local start_time=$(date +%s)
    if sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y; then
        local end_time=$(date +%s)
        local duration=$((end_time - start_time))
        echo -e "\033[1;32m✅ Update complete in ${duration}s!\033[0m"
    else
        echo -e "\033[1;31m❌ Update failed! Check the output above.\033[0m"
    fi
}

# ======================================================
# 🚀 Demo Calls
# ======================================================

echo "===== Basic Function ====="
greet_basic

echo "===== Function with Arguments ====="
hello "Siam"
hello   # error demonstration

echo "===== Default Argument ====="
greet_default "Alice"
greet_default   # default

echo "===== Function with Return Value ====="
result=$(add 10 20)
echo "10 + 20 = $result"

echo "===== Local vs Global Variables ====="
echo "Outside function: $var"
test_scope
echo "Outside function still: $var"

echo "===== Multiple Arguments & Loops ====="
greet_all Alice Bob Charlie

echo "===== Recursive Function (Factorial) ====="
echo "Factorial 5 = $(factorial 5)"

echo "===== Error Handling ====="
safe_divide 10 2
safe_divide 10 0

echo "===== Function Returning Array ====="
even_numbers=($(get_even_numbers 10))
echo "Even numbers: ${even_numbers[@]}"

# Note: Uncomment the next line to run updater
# update_kali
