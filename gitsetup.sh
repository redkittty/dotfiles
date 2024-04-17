#!/bin/sh
# Git setup
echo "Login to your Git Account"
echo "Remember, You can press CTRL+C to exit a shell script"

# USERNAME
# Username prompt
read -p "Enter your username: " username

# Check if username is empty
if [ -z "$username" ]
then
  echo "Error: enter a username"
  exit 1
fi

# Set username
git config --global user.name "$username"

# EMAIL ADDRESS
# Email adress prompt
read -p "Enter your email address: " email

# Check if email is empty
if [ -z "$email" ]
then
  echo "Error: Please enter a valid email address."
  exit 1
fi

# Set email address globally
git config --global user.email "$email"

echo "Logged in successfully!"
