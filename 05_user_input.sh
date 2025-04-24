#!/bin/bash   # Shebang: tells the system to use bash to run this script

# ----------------------------------------
# ✅ Taking user input
# ----------------------------------------
read -p "Enter your name: " name           # Prompt user for their name and store it in 'name'
read -p "Enter your age: " age             # Prompt user for their age and store it in 'age'
read -p "Enter your email: " email         # Prompt user for their email and store it in 'email'

# ----------------------------------------
# ✅ String operations on name
# ----------------------------------------
echo -e "\n------------------ Name Info ------------------"
echo "Hello, $name!"                                 # Greet the user using their name
echo "Your name has ${#name} characters."            # ${#var}: Gives the length of the string
echo "Your name in UPPERCASE: ${name^^}"             # ^^: Convert entire string to uppercase
echo "Your name in lowercase: ${name,,}"             # ,,: Convert entire string to lowercase
echo "Your name in Title Case (first letter capital): ${name^}"   # ^: Capitalize first letter
echo "Your name with lowercase first letter: ${name,}"            # ,: Lowercase the first letter

# ----------------------------------------
# ✅ Operations on age
# ----------------------------------------
echo -e "\n------------------ Age Info ------------------"
echo "You are $age years old."                        # Display user's age
(( next_year = age + 1 ))                             # Calculate age for next year
echo "Next year, you'll be $next_year years old."

# ----------------------------------------
# ✅ Operations on email
# ----------------------------------------
echo -e "\n------------------ Email Info ------------------"
echo "Your email is: $email"                          # Display email
username=${email%@*}                                  # Extract part before '@'
domain=${email#*@}                                    # Extract part after '@'
echo "Username part of email: $username"
echo "Domain part of email: $domain"

# ----------------------------------------
# ✅ Summary
# ----------------------------------------
echo -e "\n------------------ Summary ------------------"
echo "Name: $name | Age: $age | Email: $email"
echo "Uppercase Name: ${name^^}, Email Domain: $domain"
echo -e "-------------------------------------------------\n"

# 🧠 Quick Bash Concepts Recap:
# - ${var}: Accesses variable value
# - ${#var}: Returns length of string
# - ${var^^}: Converts to uppercase
# - ${var,,}: Converts to lowercase
# - ${var^}: Capitalizes first letter
# - ${var,}: Lowercase first letter
# - ${var#pattern}: Removes shortest match from the front
# - ${var%pattern}: Removes shortest match from the end
