#!/bin/bash


#prompt user to choose selection (not case sensitive)
while true; do
    echo -e "\n\nEnter one of the following actions of press CTRL-D to exit."
    echo ""
    echo -e "  C - create a new inventory item\n"
    echo -e "  R - read an existing inventory item\n"
    echo -e "  U - update an existing inventory item\n"
    echo -e "  D - delete an existing inventory item\n"
    echo -e "  T - calculate total value of an inventory item\n"

    if ! read INPUT; then
        #got EOF
        break
    fi

    case $INPUT in
       [cC])
        bash ./create.bash
        ;;
        [rR])
        bash ./read.bash
        ;;
        [uU])
        bash ./update.bash
        ;;
        [dD])
        bash ./delete.bash
        ;;
        [tT])
        bash ./total.bash
        ;;
        *)
        echo -e "\nPlease enter a valid selection or press CTRL-D to exit\n"
        ;;
    esac
done
