#!/bin/bash

#create script to read item number

echo "Enter an item number: "
read item_num

filename="${item_num}.item"

get_abs_filename() {
      # $1 : relative filename
        echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

filepath=$(get_abs_filename "$filename")

readFile(){
    read item_name simp_name
    read unit_price curr_qty max_qty
    read desc
}

if [ -s $filepath ] ; then
    readFile < $filepath
    
    echo -e "\nItem Number: $item_num\n"
    echo -e "Item Name: ${item_name}\n"
    echo -e "Simple Name: ${simp_name}\n"
    echo -e "Unit Price: ${unit_price}\n"
    echo -e "Quantity: ${curr_qty} / ${max_qty}\n"
    echo -e "Description: ${desc}"
else
    echo -e "ERROR: item $item_num not found.\n"
fi

#search for the specific item number in direcTORY
# print item number, item name, simple name, unit price, quantity curr / max, d
