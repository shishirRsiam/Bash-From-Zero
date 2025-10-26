#!/bin/bash

# ---------------------------------------------
# 📘 Bash File Test Operators (Part 2)
# 👉 Combining Conditions and Logical Operations
# ---------------------------------------------

###############################################
# 1️⃣ CHECK MULTIPLE CONDITIONS WITH AND (&&)
###############################################

echo "---- AND (&&) Example ----"

touch test.txt

# Check if file exists AND is writable
if [[ -f test.txt && -w test.txt ]]; then
    echo "✅ test.txt exists and is writable."
else
    echo "❌ test.txt is missing or not writable."
fi


###############################################
# 2️⃣ CHECK EITHER CONDITION WITH OR (||)
###############################################

echo
echo "---- OR (||) Example ----"

# Check if file is readable OR executable
if [[ -r test.txt || -x test.txt ]]; then
    echo "✅ test.txt is readable or executable."
else
    echo "❌ test.txt is neither readable nor executable."
fi


###############################################
# 3️⃣ NEGATION WITH NOT (!)
###############################################

echo
echo "---- NOT (!) Example ----"

# Check if file does NOT exist
if [[ ! -e missing.txt ]]; then
    echo "✅ missing.txt does not exist."
else
    echo "❌ missing.txt exists."
fi


###############################################
# 4️⃣ NESTED CONDITIONS (IF INSIDE IF)
###############################################

echo
echo "---- NESTED IF Example ----"

if [[ -f test.txt ]]; then
    echo "File exists."
    if [[ -s test.txt ]]; then
        echo "File is not empty."
    else
        echo "File is empty."
    fi
else
    echo "File does not exist."
fi


###############################################
# 5️⃣ USING ELIF (ELSE IF)
###############################################

echo
echo "---- ELIF Example ----"

if [[ -d test.txt ]]; then
    echo "It’s a directory."
elif [[ -f test.txt ]]; then
    echo "It’s a regular file."
else
    echo "It’s something else."
fi


###############################################
# 6️⃣ COMBINING COMMANDS WITH && and ||
###############################################

echo
echo "---- Command Chaining Example ----"

# Create a file if it doesn’t exist
[[ -f data.txt ]] && echo "✅ data.txt exists" || echo "⚠️ Creating data.txt..." && touch data.txt


###############################################
# 7️⃣ COMPLEX EXAMPLE (MULTI-CONDITION)
###############################################

echo
echo "---- COMPLEX CONDITION Example ----"

file="myfile.txt"

# Create a test file
echo "Hello" > "$file"

if [[ -f "$file" && -r "$file" && -s "$file" ]]; then
    echo "✅ '$file' exists, is readable, and not empty."
else
    echo "❌ '$file' missing, unreadable, or empty."
fi


###############################################
# 8️⃣ CLEANUP
###############################################

rm -f test.txt data.txt myfile.txt


###############################################
# 💡 SUMMARY
###############################################
# [[ condition1 && condition2 ]]   → AND: both must be true
# [[ condition1 || condition2 ]]   → OR: at least one must be true
# [[ ! condition ]]                → NOT: condition must be false
# [[ -f "$file" && -r "$file" ]]   → file exists AND is readable
# [[ -f "$file" || -d "$file" ]]   → file OR directory check
# [[ ! -e "$file" ]]               → file does not exist
# [[ A -nt B && B -nt C ]]         → chain comparisons (newer files)
# [[ -s "$file" ]] && echo ok      → short form (one-liner)
# [[ -f "$file" ]] || touch "$file"→ create if missing
# ✅ Use quotes around variables to prevent globbing & word-splitting
# ✅ Prefer [[ ... ]] over [ ... ] for modern Bash scripts
