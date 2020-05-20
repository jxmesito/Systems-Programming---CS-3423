#!/bin/bash


#update an existing inventory record

get_abs_filename() {
    # $1 : relative filename
    echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

readFile(){
    read item_name simp_name
    read unit_price curr_qty max_qty
    read desc
}

writeFile(){
 echo "$item_name $simp_name"
 echo "$unit_price $curr_qty $max_qty"
 echo "$desc"
}

read -p "Item Number: " new_item_num
read -p "Item name:" new_item_name
read -p "Simple name:" new_simp_name
read -p "Unit price:" new_unit_price
read -p "Current Quantity:" new_curr_qty
read -p "Maximim Quantity:" new_max_qty
read -p "Description:" new_item_desc

filename="${item_num}.item"
filepath=$(get_abs_filename "$filename")

createLog() {
  #update log
  d=$(date +%Y-%m-%d__%H:%M:%S)
  echo "[$d] UPDATED: ${new_item_num} - ${new_item_name} - ${new_curr_qty} / ${new_max_qty}"
}
    
    q_filepath=$(get_abs_filename "queries.log")
    
    writeFile > $filename
    createLog >> $q_filepath
