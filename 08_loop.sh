#!/bin/bash

# ---------------------------------------------
# 💡 Bash Loop Tutorial with Examples
# ---------------------------------------------

###############################################
# 1️⃣ FOR LOOP (C-style)
###############################################

echo "---- FOR LOOP (C-style) ----"
for ((count=1; count<=5; count++)); do
    echo "Count = $count"
done
# ➜ Prints numbers 1 to 5


###############################################
# 2️⃣ FOR LOOP (List-style)
###############################################

echo
echo "---- FOR LOOP (List-style) ----"
for item in apple banana orange; do
    echo "Fruit: $item"
done
# ➜ Loops through a list of words.


###############################################
# 3️⃣ FOR LOOP WITH ARRAY
###############################################

echo
echo "---- FOR LOOP (Array iteration) ----"

# Define an array
fruits=("mango" "banana" "cherry" "grape")

# Loop through all elements in the array
for fruit in "${fruits[@]}"; do
    echo "I like $fruit"
done

# Access array elements with index
echo "Second fruit: ${fruits[1]}"  # Output: banana


###############################################
# 4️⃣ FOR LOOP OVER COMMAND OUTPUT
###############################################

echo
echo "---- FOR LOOP (Over command output) ----"

# Example: loop over list of files
for file in $(ls *.sh 2>/dev/null); do
    echo "Found shell script: $file"
done
# Note: Use quotes around variables if filenames may contain spaces!


###############################################
# 5️⃣ WHILE LOOP
###############################################

echo
echo "---- WHILE LOOP ----"

count=1
while [[ $count -le 5 ]]; do
    echo "count = $count"
    ((count++))
done
# ➜ Runs while condition is true


###############################################
# 6️⃣ UNTIL LOOP
###############################################

echo
echo "---- UNTIL LOOP ----"
# Similar to while, but runs UNTIL the condition becomes true.

num=1
until [[ $num -gt 5 ]]; do
    echo "Number = $num"
    ((num++))
done
# ➜ Keeps looping until num > 5


###############################################
# 7️⃣ NESTED LOOPS
###############################################

echo
echo "---- NESTED LOOPS ----"

for ((i=1; i<=3; i++)); do
    for ((j=1; j<=3; j++)); do
        echo "i=$i, j=$j"
    done
done
# ➜ Inner loop runs fully for each iteration of the outer loop


###############################################
# 8️⃣ BREAK and CONTINUE
###############################################

echo
echo "---- BREAK and CONTINUE ----"

for ((x=1; x<=10; x++)); do
    if [[ $x -eq 3 ]]; then
        echo "Skipping number 3"
        continue    # Skip this iteration
    fi
    if [[ $x -eq 8 ]]; then
        echo "Breaking at 8"
        break       # Exit the loop completely
    fi
    echo "x = $x"
done


###############################################
# 9️⃣ WHILE LOOP READING A FILE LINE BY LINE
###############################################

echo
echo "---- WHILE LOOP (Reading file) ----"

# Create a sample text file
echo -e "line1\nline2\nline3" > sample.txt

while IFS= read -r line; do
    echo "Read: $line"
done < sample.txt

rm sample.txt  # cleanup


###############################################
# 🔟 FOR LOOP WITH SEQ COMMAND
###############################################

echo
echo "---- FOR LOOP (Using seq) ----"

for num in $(seq 1 5); do
    echo "Number from seq: $num"
done
# ➜ seq generates sequences of numbers


###############################################
# 💡 SUMMARY
###############################################
# for ((init; condition; step))   → C-style loop for numeric iteration
# for var in list                 → Loop through items
# while [[ condition ]]           → Runs while condition is true
# until [[ condition ]]           → Runs until condition becomes true
# break / continue                → Control loop flow
# Nested loops                    → One loop inside another
# Arrays                          → Use "${array[@]}" to loop elements
# Command output                  → Loop through output of commands

