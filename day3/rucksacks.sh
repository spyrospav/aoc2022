#!/bin/bash

declare -A ascii_table

n=1
for i in {a..z} {A..Z}; do
    ascii_table[$i]=$n
    n=$((n+1))
done

filename=$1

suma=0
sumb=0
group=1
while read line || [ -n "$line" ]; do

    # Part 1
    
    s=${line:0:${#line}/2}
    t=${line:${#line}/2}

    declare -A dict

    for (( i=0; i<${#s}; i++ )); do
        dict[${s:$i:1}]=1
    done

    for (( i=0; i<${#t}; i++ )); do
        if [[ ${dict[${t:$i:1}]} ]]; then
            ((suma+=ascii_table[${t:$i:1}]))
            break
        fi
    done

    unset dict

    # Part 2
    
    declare -A badges

    for (( i=0; i<${#line}; i++ )); do
        if [[ ${badges[${line:$i:1}]} -eq $((group - 1)) ]]; then
            ((badges[${line:$i:1}]=group))
        fi
        if [[ ${badges[${line:$i:1}]} -eq 3 ]]; then
            ((sumb+=ascii_table[${line:$i:1}]))
            break
        fi
    done

    if [[ ${group} -eq 3 ]]
    then
        ((group=1))
        unset badges
    else
        ((group++))
    fi

done < $filename

echo $suma
echo $sumb