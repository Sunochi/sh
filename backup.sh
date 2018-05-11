#!/bin/bash

realpath ()
{
    f=$@;
    if [ -d "$f" ]; then
        base="";
        dir="$f";
    else
        base="/$(basename "$f")";
        dir=$(dirname "$f");
    fi;
    dir=$(cd "$dir" && /bin/pwd);
    echo "$dir$base"
}

moveDir()
{
echo "success!"
echo "Make buckup folder '~/.backup'"
}

moveFile()
{
echo "success!"
echo "Make buckup folder '~/.backup'"
}

if [ $# -eq 0 ]
then
    printf "Usage: backup files\n"
    exit
elif [ $# -eq 1 -a -e $1 ]
then
    path=`realpath $1`
    echo $path
    if [[ $path =~ ^/* ]]
    then
        if [ -f $path ]
        then
            echo "ファイルはあります！"
            moveFile $path
        elif [ -d $path ]
        then
            echo "ディレクトリはあります！"
            moveDir $path
        fi
    else
        echo "An error occurred. Absolute path required."
    fi
else
    echo "You typed incorrected path or many arguments."
fi
