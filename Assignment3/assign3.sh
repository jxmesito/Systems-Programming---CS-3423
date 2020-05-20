#!/bin/bash
for var in $@
   do
        sed -r -e '/^[^a-z]{3}[^0-9]{3}/d' $var | sort | awk -f ./assign3.awk
done

    sed -r -e '/^[^a-z]{3}[^0-9]{3}/d' | sort | awk -f ./assign3.awk

