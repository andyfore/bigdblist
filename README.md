bigdblist
=========

The file bigdblist.sh is a simple bash script that takes the MySQL data directory as an argument and returns a list of the large databases, as well as the mysql database, in a space-delimited single line list suitable for use in a bash array.

In this particular setting "large" is arrbitrarily set as anything greater than 1GB.

Also, the check is just a simple filesystem space check, not an actual check performed against the information schema of the MySQL instance.
