#!/bin/bash
array_name=("田中1" "田中2" "田中3" "田中4" "田中5" "田中6" "田中7" "田中8" "田中9" "田中10")
array_seki=("左前左" "左前右" "左後左" "左後右" "右前左" "右前中" "右前右" "右後左" "右後中" "右後右")
array_count=(0 0 0 0 0 0 0 0 0 0)

nums=${#array_name[*]}

function changeAll() {
    while :
    do
        random=$((RANDOM%$nums))
        if [ $(( array_count[$random]+1 )) -eq 1 ]
        then
            name=${array_name[$random]}
            seki=${array_seki[$random]}
            echo $seki : $name
            array_count[$random]=$(( array_count[$random]+1 ))
            break
        fi
    done

}

for ((i=0 ; i < $nums ; i++))
do
    changeAll
done
