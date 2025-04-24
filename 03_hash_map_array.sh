#!/bin/bash   # Shebang line – tells the system to use the Bash shell to run this script.

# -----------------------------------------
# ✅ Declare an associative array (hash map)
# -----------------------------------------
declare -A unordered_map   # Declare an associative array using `-A` (key-value pairs instead of index-based)

# -----------------------------------------
# ✅ Initialize associative array with key-value pairs
# -----------------------------------------
unordered_map=(                    # Assign key-value pairs using square brackets [key]=value
    [name]="Sishir Siam"           # name → "Sishir Siam"
    [age]=21                       # age → 21
    [birthday]="15 May 2004"       # birthday → "15 May 2004"
    [phone]="+8801317-129349"      # phone → "+8801317-129349"
    [address]="Lalmonithat, Dhaka, Bangladesh"  # address → full string
)

# -----------------------------------------
# ✅ Add more key-value pair after initialization
# -----------------------------------------
unordered_map[email]="shishir.siam01@gmail.com"  # Add a new key 'email' and assign its value

# -----------------------------------------
# ✅ Print all values using keys
# -----------------------------------------
echo "-----------------------------------------"
echo "Name: ${unordered_map[name]}"         # Acess value using key 'name'
echo "Age: ${unordered_map[age]}"           # Acess value using key 'age'
echo "Birthday: ${unordered_map[birthday]}" # Acess value using key 'birthday'
echo "Phone: ${unordered_map[phone]}"       # Acess value using key 'phone'
echo "Email: ${unordered_map[email]}"       # Acess value using key 'email'
echo "Address: ${unordered_map[address]}"   # Acess value using key 'address'
echo -e "-----------------------------------------\n\n"

# -----------------------------------------
# ✅ Print all keys and values from the associative array
# -----------------------------------------
echo "-----------------------------------------"
echo "All keys in the associative array: ${!unordered_map[@]}"   # !array[@] gives all keys
echo "All values in the associative array: ${unordered_map[@]}"  # array[@] gives all values
echo "-----------------------------------------"

<<Recap
🧠 Quick Bash Concepts Recap:
    - declare -A arr: Declares an associative array
    - [key]=value: Sets key-value pairs
    - ${arr[key]}: Accesses value by key
    - ${!arr[@]}: Gets all keys from associative array
    - ${arr[@]}: Gets all values from associative array
    - echo -e: Enables interpretation of backslash escapes like \n
Recap