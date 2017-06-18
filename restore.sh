#!/bin/bash



# Validate arguments
if [ $# -lt 2 ]
  then
    echo "Not enough arguments supplied!"
    echo "Please add db_name and file_path to the script arguments"
    return
  else
    db_name=$1
    file_path=$2
fi

if [ ! -f $file_path ]
  then
    echo "File $file_path was not found!"
    return
fi

echo "File: $file_path"
echo "DB:   $db_name"

# Confirm
read -p "Are you sure you want to continue? (y/n)" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    echo "The operation was canceled"
    return
fi

# Restore database
echo "Restoring $db_name database..."
zcat < $file_path | mysql --user=root $db_name
