#!/bin/bash
array_name=("vim" "サクラエディタ" "atom" "Visual Stadio" "Mono Develop" "一太郎" "emacs" "nano" "eclipse" "メモ帳")
array_count=(0 0 0 0 0 0 0 0 0 0)
names=${#array_name[*]}

function disp() {
    random=$((RANDOM%$names))
    echo ${array_name[$random]}
    array_count[$random]=$(( array_count[$random]+1 ))
}

if [ $# -eq 0 ]
then
    disp
elif [ $# -eq 1 -a $1 -ge 0 ]
then
    for ((i=0 ; i < $1 ; i++))
    do
    disp
    done
    if [ $1 -gt 0 ];
    then
        printf "\n"
        for ((j=0; j < $names; j++))
        do
        echo "$j, ${array_count[$j]}"
        done
    fi
fi
