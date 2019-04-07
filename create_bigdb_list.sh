#!/bin/bash

# Created by 2014-07-08
# Script name: create_bigdb_list.sh
# Original Author: Andrew Fore, andy.fore@arfore.com
# Purpose: The file bigdblist.sh is a simple bash script that takes the MySQL
#          data directory as an argument and returns a list of the large databases,
#          as well as the mysql database, in a space-delimited single line list suitable
#          for use in a bash array.  The check is just a simple filesystem check, but
#          this is a reasonable rule of thumb.

# Variable definitions
#
# data_dir - string to hold the supplied commandline argument of the MySQL data directory
# db_list - string to hold the final list of databases

# get the data directory from the commandline argument
data_dir=$1

# change to the data directory to execute the search and sort
cd ${data_dir}

# get the list of databases that take up more than 1GB on the filesystem
db_list=`du -h | grep "^ *[0-9][0-9.]*G" | sort -n | awk '{print $2}' | cut -c 3- | awk 'NR > 1 { print prev } { prev = $0 }' | awk '{printf "%s'\'' '\''",$0} END {print ""}' | awk '{sub(/\ '\''$/,"");print}'`

# check to see if the result set is empty, if not then add the mysql db to the front of the list and return
if [ ! -z $db_list ]; then
    echo "'${db_list}"
else
    echo "'mysql' '${db_list}"
fi

exit 0
