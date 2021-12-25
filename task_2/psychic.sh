#!/usr/bin/bash

declare -i steps=1
greating="Please enter number from 150 to 159 (q - quit):"
declare -i cor_cnt=0
declare -a arr
declare arr_entry

while true

do

        declare -i correct=$((150 + $RANDOM % 10))
        arr_entry=$correct

        echo Steps: $steps
        echo $greating

        read number

        if [[ $number -eq "q" ]]
        then
                exit 0
        elif [[ $number -gt 159 || $number -lt 150 ]]
        then
                echo "Number is not in range"
                echo "$greating"
                continue
        fi

        if [[ $number -eq correct ]]
        then
                echo "You right!"
                arr_entry=$correct
                arr_entry="${arr_entry}+"
                ((cor_cnt = cor_cnt + 1))
        else
                echo "Miss! Correct: $correct"
        fi

        echo "Hit: $(( cor_cnt * 100 / steps))% Miss: $(( (steps - cor_cnt) * 100 / steps ))%"

        if [[ steps -le 8 ]]
        then
                arr[$steps - 1]=$arr_entry
        else
                arr=("${arr[@]:1}")
                arr[7]=$arr_entry
        fi

        echo -e "Numbers: ${arr[@]}\n"

        ((steps = steps + 1))

done