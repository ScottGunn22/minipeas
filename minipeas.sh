#!/bin/bash

# Function to find files with SUID and SGID permissions set
find_suid_sgid() {
  printf "\033[0;33mFinding files with SUID and SGID permissions set:\n\033[0m"
  find . -type f \( -perm -4000 -o -perm -2000 \) -exec ls -l {} +
}

# Function to find files or directories with world read permissions
find_world_readable() {
  printf "\033[0;33m\nFinding files or directories with world read permissions:\n\033[0m"
  find . -type f -perm -4 -exec ls -l {} +
}

# Function to find files or directories with world write and execute permissions
find_world_writable_executable() {
  printf "\033[0;33m\nFinding files or directories with world write and execute permissions:\n\033[0m"
  find . -type f -perm -2 -exec ls -l {} +
  printf "\033[0;33m\nFinding files or directories with world execute permissions:\n\033[0m"
  find . -type f -perm -1 -exec ls -l {} +
}

# Function to search for files containing keywords "pass" and "password"
search_keywords() {
  printf "\033[0;33m\nSearching for files with keywords 'pass' and 'password':\n\033[0m"
  grep -rli --include=\*.{txt,conf,bak,old,ini,db} -e "pass" -e "password" .
}

# Function to find files with specific extensions
find_specific_extensions() {
  printf "\033[0;33m\nFinding files with extensions .txt, .conf, .bak, .old, .ini, .db:\n\033[0m"
  find . -type f \( -iname "*.txt" -o -iname "*.conf" -o -iname "*.bak" -o -iname "*.old" -o -iname "*.ini" -o -iname "*.db" \)
}

# Main function to run the above functions
main() {
  find_suid_sgid
  find_world_readable
  find_world_writable_executable
  search_keywords
  find_specific_extensions
}

# Execute main function
main
