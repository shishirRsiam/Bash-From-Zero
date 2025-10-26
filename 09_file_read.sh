#!/bin/bash

# ---------------------------------------------
# 📘 Bash File Reading Tutorial with Examples
# ---------------------------------------------

###############################################
# 1️⃣ METHOD 1: WHILE READ LOOP
###############################################

# Create a sample file
echo -e "apple\nbanana\ncherry" > file.txt

echo "---- WHILE READ LOOP ----"
while IFS= read -r line; do
    echo "Read (while): $line"
done < file.txt


###############################################
# 2️⃣ METHOD 2: MAPFILE (READARRAY)
###############################################

echo
echo "---- MAPFILE METHOD ----"

mapfile -t lines < file.txt

echo "Total lines read: ${#lines[@]}"

for line in "${lines[@]}"; do
    echo "Read (mapfile): $line"
done


###############################################
# 3️⃣ CHECK FILE EXISTENCE BEFORE READING
###############################################

echo
echo "---- FILE EXISTENCE CHECK ----"

FILE="file.txt"
if [[ -f "$FILE" ]]; then
    mapfile -t lines < "$FILE"
    echo "File '$FILE' loaded successfully!"
else
    echo "Error: File '$FILE' not found."
    exit 1
fi


###############################################
# 4️⃣ PRINT ALL LINES IN ONE LINE
###############################################

echo
echo "---- PRINT ALL LINES (SINGLE LINE) ----"
echo "All lines: ${lines[*]}"


###############################################
# 5️⃣ CLEANUP
###############################################

rm -f file.txt


###############################################
# 💡 SUMMARY
###############################################
# while IFS= read -r line; do ... done < file   → Reads file line-by-line (portable)
# mapfile -t array < file                       → Reads all lines into an array (Bash-only)
# "${array[@]}"                                 → Expands all array elements
# "${#array[@]}"                                → Gives number of lines (array elements)
# [[ -f file ]]                                 → Checks if file exists
# echo "${array[*]}"                            → Prints all lines in a single line
# Use IFS= and -r to preserve spaces and backslashes
# Cleanup temporary files when done
