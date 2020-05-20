#!/bin/bash


    # create variables to hold item info
    echo "Item number:"
    read item_num

    # depending on item name, create a file that begins with that file name and
    # ends in a .item extension and store information to the file
    
    filename="${item_num}.item"
         
    #create file directory
    get_abs_filename() {
      # $1 : relative filename
        echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
    }

    filename_index=$(get_abs_filename "$filename")
    #test to see if item file already exsists
    if [ -f "$filename_index" ]
        then
        echo "ERROR: item $item_num already exists"
        exit 1
    fi

    echo "Item name:"
    read item_name
    echo "Simple name:"
    read simp_name
    echo "Unit price:"
    read unit_price
    echo "Current Quantity:"
    read curr_qty
    echo "Maximim Quantity:"
    read max_qty
    echo "Description:"
    read item_desc


    first_ln="${item_name} ${simp_name}"
    second_ln="${unit_price} ${curr_qty} ${max_qty}"
    third_ln="${item_desc}"


    #create file and test if it is indeed a file
    touch $filename
    if [ -f "$filename_index" ]
        then
            #update file with information
            echo "$first_ln" >> "$filename_index"
            echo "$second_ln" >> "$filename_index"
            echo "$third_ln" >> "$filename_index"
    fi

    #update log
    d=$(date +%Y-%m-%d__%H:%M:%S)
    data="[$d] CREATED: $item_num - $item_name - $curr_qty / $max_qty"
    destdir=/home/jwg455/courses/cs3423/Assignment1/data/queries.log

    if [ -f "$destdir" ]
        then 
            echo "$data" >> "$destdir"
    fi
