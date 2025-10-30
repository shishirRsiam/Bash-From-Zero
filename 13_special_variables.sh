#!/bin/bash

# ------------------------------------------------------------
# 💡 Bash Special Variables Tutorial
# ------------------------------------------------------------
# Special variables provide information about the script, 
# its arguments, process IDs, exit codes, etc.
# ------------------------------------------------------------

echo "1️⃣ \$0 → Script name"
echo "Script name: $0"   # Name/path of the script being executed

echo
echo "2️⃣ \$# → Number of arguments passed to script"
echo "Number of arguments: $#"

echo
echo "3️⃣ \$@ → All arguments as separate words"
echo "All arguments (\$@): $@"
echo "Looping over arguments:"
for arg in "$@"; do
    echo "Arg: $arg"
done

echo
echo "4️⃣ \$* → All arguments as single word"
echo "All arguments (\$*): $*"
echo "Looping over arguments using \$* (quotes matter!):"
for arg in $*; do
    echo "Arg: $arg"
done

echo
echo "5️⃣ \$? → Exit status of last command"
ls /nonexistent_folder >/dev/null 2>&1
echo "Exit status of last command: $?"

echo
echo "6️⃣ \$! → PID of last background process"
sleep 5 &
echo "PID of last background process: $!"

echo
echo "7️⃣ \$$ → PID of current script"
echo "PID of this script: $$"

echo
echo "8️⃣ \$- → Current shell options"
echo "Current shell options: $-"

echo
echo "9️⃣ \$RANDOM → Random number (0-32767)"
echo "Random number: $RANDOM"
echo "Another random number: $RANDOM"

echo
echo "🔟 \$LINENO → Current line number in the script"
echo "This is line number: $LINENO"

echo
echo "1️⃣1️⃣ \$USER → Current logged in user"
echo "Logged in user: $USER"

echo
echo "1️⃣2️⃣ \$PWD → Current working directory"
echo "Current directory: $PWD"

echo
echo "1️⃣3️⃣ \$OLDPWD → Previous working directory"
echo "Previous directory: $OLDPWD"

echo
echo "1️⃣4️⃣ \$IFS → Internal Field Separator (used in word splitting)"
echo "Default IFS: '$IFS'"

# Example: splitting a string using IFS
str="apple,banana,cherry"
IFS=',' read -ra fruits <<< "$str"
echo "Splitted fruits:"
for f in "${fruits[@]}"; do
    echo "$f"
done

# ------------------------------------------------------------
# 🧠 SUMMARY
# ------------------------------------------------------------
# $0      → Script name
# $#      → Number of arguments
# $@      → All arguments as separate words
# $*      → All arguments as single string
# $?      → Exit status of last command
# $$      → PID of current shell/script
# $!      → PID of last background process
# $-      → Current shell options
# $RANDOM → Random number (0-32767)
# $LINENO → Current line number in script
# $USER   → Logged in user
# $PWD    → Current working directory
# $OLDPWD → Previous working directory
# $IFS    → Internal Field Separator (used for splitting)
#
# ✅ Use $@ in quotes ("$@") to preserve argument separation
# ✅ Use $? to check if a command succeeded
# ✅ Use $$ or $! to track processes
# ✅ Use $IFS carefully when parsing strings
# ------------------------------------------------------------
