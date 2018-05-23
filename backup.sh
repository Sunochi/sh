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

copyDir()
{
  CURRENT_DATE=`date '+%Y%m%d_%H%M%S'`
  dir_name="${1}_${CURRENT_DATE}/"
  mkdir -p ~/.backup$dir_name
  cp -r $1 ~/.backup$dir_name
  echo "success!"
}

copyFile()
{
  CURRENT_DATE=`date '+%Y%m%d_%H%M%S'`

  file_name="${1}_${CURRENT_DATE}"
  dir=$(dirname "$file_name")
  echo $file_name
  mkdir -p ~/.backup$dir
  cp $1 ~/.backup$file_name
  echo "success!"
}
if [ ! -e ~/.backup ]
then
    mkdir ~/.backup
fi

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
            copyFile $path
        elif [ -d $path ]
        then
            echo "ディレクトリはあります！"
            copyDir $path
        fi
    else
        echo "An error occurred. Absolute path required."
    fi
else
    echo "You typed incorrected path or many arguments."
fi
