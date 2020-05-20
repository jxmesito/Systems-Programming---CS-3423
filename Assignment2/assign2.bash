#!/bin/bash

chmod u+x script.sed


# read in file and perform various commands on it using sed
for var in "$@"
    do
        sed -r -i -f script.sed $var
done 

# echo file contents after changes
cat "$@"

