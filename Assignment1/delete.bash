#!/bin/bash

#delete.bash

echo "Enter an item number: "
read item_number
file_name="${item_number}.item"
filepath=/home/jwg455/courses/cs3423/Assignment1/data/$file_name
readFile(){
read item_name simp_name
read unit_price curr_qty max_qty
read desc
}


if [ -s $file_name ]
    then
    readFile < $filepath
    #update log
    d=$(date +%Y-%m-%d__%H:%M:%S)
    data="[$d] DELETED: ${item_number} - ${item_name} - ${simp_name} - ${curr_qty}"
    echo "$data"
    destdir=/home/jwg455/courses/cs3423/Assignment1/data/queries.log

    if [ -f "$destdir" ]
        then
            echo "$data" >> "$destdir"
    fi
    rm -f $file_name
    else
        echo "ERROR: Item not found"
fi
