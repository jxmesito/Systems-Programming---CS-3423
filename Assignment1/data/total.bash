

#prompt user for item number
echo -e "Enter an item number: "
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

#calc total inventory value for specific item
if [ -f $filename ]; then
    readFile < $filepath
    total=$( bc <<<"$unit_price * $curr_qty" )
    echo -e "${item_num} - ${simp_name} - $ ${total} total"
fi
#print total

#if item does not exist prompt item not found

