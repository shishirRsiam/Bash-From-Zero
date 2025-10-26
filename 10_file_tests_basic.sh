#!/bin/bash

# ---------------------------------------------
# 📘 Bash File Test Operators Tutorial
# ---------------------------------------------
# These operators are used with [[ ... ]] or [ ... ] 
# to check properties of files and directories.

###############################################
# 💡 Notes
###############################################
# [[ -e file ]] → File exists (any type)
# [[ -f file ]] → Regular file
# [[ -d dir ]]  → Directory
# [[ -r file ]] → File is readable
# [[ -w file ]] → File is writable
# [[ -x file ]] → File is executable
# [[ -s file ]] → File is NOT empty (size > 0)
# [[ -L file ]] → Symbolic link
# [[ file1 -nt file2 ]] → file1 is newer than file2
# [[ file1 -ot file2 ]] → file1 is older than file2
# [[ -p file ]] → Named pipe
# [[ -b file ]] → Block device (like disk)
# [[ -c file ]] → Character device (like terminal)
# [[ -S file ]] → Socket file
# [[ ! -e file ]] → File does NOT exist



###############################################
# 1️⃣ CHECK IF FILE EXISTS (-e)
###############################################

echo "---- CHECK IF FILE EXISTS (-e) ----"

touch demo.txt  # create a sample file

if [[ -e demo.txt ]]; then
    echo "demo.txt exists."
else
    echo "demo.txt does not exist."
fi


###############################################
# 2️⃣ CHECK IF FILE IS A REGULAR FILE (-f)
###############################################

echo
echo "---- CHECK IF REGULAR FILE (-f) ----"

if [[ -f demo.txt ]]; then
    echo "demo.txt is a regular file."
else
    echo "demo.txt is NOT a regular file."
fi


###############################################
# 3️⃣ CHECK IF DIRECTORY EXISTS (-d)
###############################################

echo
echo "---- CHECK IF DIRECTORY (-d) ----"

mkdir -p mydir

if [[ -d mydir ]]; then
    echo "mydir is a directory."
else
    echo "mydir is NOT a directory."
fi


###############################################
# 4️⃣ CHECK IF FILE IS READABLE (-r)
###############################################

echo
echo "---- CHECK IF READABLE (-r) ----"

if [[ -r demo.txt ]]; then
    echo "demo.txt is readable."
else
    echo "demo.txt is NOT readable."
fi


###############################################
# 5️⃣ CHECK IF FILE IS WRITABLE (-w)
###############################################

echo
echo "---- CHECK IF WRITABLE (-w) ----"

if [[ -w demo.txt ]]; then
    echo "demo.txt is writable."
else
    echo "demo.txt is NOT writable."
fi


###############################################
# 6️⃣ CHECK IF FILE IS EXECUTABLE (-x)
###############################################

echo
echo "---- CHECK IF EXECUTABLE (-x) ----"

if [[ -x demo.txt ]]; then
    echo "demo.txt is executable."
else
    echo "demo.txt is NOT executable."
fi


###############################################
# 7️⃣ CHECK IF FILE IS EMPTY (-s)
###############################################

echo
echo "---- CHECK IF EMPTY (-s) ----"

if [[ -s demo.txt ]]; then
    echo "demo.txt is NOT empty."
else
    echo "demo.txt is empty."
fi


###############################################
# 8️⃣ CHECK FILE NEWER OR OLDER THAN ANOTHER
###############################################

echo
echo "---- CHECK FILE MODIFICATION TIME ----"

sleep 1
touch demo2.txt  # create a second file

if [[ demo2.txt -nt demo.txt ]]; then
    echo "demo2.txt is newer than demo.txt"
fi

if [[ demo.txt -ot demo2.txt ]]; then
    echo "demo.txt is older than demo2.txt"
fi


###############################################
# 9️⃣ CHECK SYMBOLIC LINK (-L)
###############################################

echo
echo "---- CHECK SYMBOLIC LINK (-L) ----"

ln -sf demo.txt link.txt

if [[ -L link.txt ]]; then
    echo "link.txt is a symbolic link."
fi


###############################################
# 🔟 CLEANUP
###############################################

rm -rf demo.txt demo2.txt mydir link.txt


###############################################
# 💡 SUMMARY
###############################################
# [[ -e file ]] → File exists (any type)
# [[ -f file ]] → Regular file
# [[ -d dir ]]  → Directory
# [[ -r file ]] → File is readable
# [[ -w file ]] → File is writable
# [[ -x file ]] → File is executable
# [[ -s file ]] → File is NOT empty (size > 0)
# [[ -L file ]] → Symbolic link
# [[ file1 -nt file2 ]] → file1 is newer than file2
# [[ file1 -ot file2 ]] → file1 is older than file2
# [[ -p file ]] → Named pipe
# [[ -b file ]] → Block device (like disk)
# [[ -c file ]] → Character device (like terminal)
# [[ -S file ]] → Socket file
# [[ ! -e file ]] → File does NOT exist
# ---------------------------------------------
# ✅ Use [[ ... ]] instead of [ ... ] for safer syntax.
# ✅ Always quote variables: [[ -f "$file" ]] to handle spaces.
# ✅ Combine checks: [[ -f "$file" && -r "$file" ]] → file exists and readable.
