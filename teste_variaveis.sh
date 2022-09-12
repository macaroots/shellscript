#!/bin/bash
# 
# for a in ~/parameters.txt
# do
#     echo $a
# done

# file=$(ls) # 'parameters.txt')
# echo a${file}b
# i=1
# while read line
# do
#     echo Linha$i: $line
#     i=$((i+1))
# done < $file

# teste devolver string e escrever dentro da função
# lockdir="somedir"
# testlock(){
#     retval=""
#     if mkdir "$lockdir"
#     then # Directory did not exist, but it was created successfully
#          echo >&2 "successfully acquired lock: $lockdir"
#          retval="a"
#     else
#          echo >&2 "cannot acquire lock, giving up on $lockdir"
#          retval="b"
#     fi
#     echo "$retval"
# }
# 
# $a=$(testlock)
# echo $a


# trata a opção -d
# Usage: getopts optstring var [arg]
# while getopts ":d h e" option; do
#     echo a:$option
#    case $option in
#       --with-decryption|d) decriptionType=--with-decryption;;
#    esac
# done

args="$@"
for i in "${!foo[@]}"; do 
    arg="${foo[$i]}"
    echo $arg
    case "$arg" in
        -d)
            echo 'pegou d'
            ;;
        -e)
            echo 'pegou e': "${foo[$i+1]}"
            i=$(($i+1))
            
            ;;
    esac
done

echo final:${args[@]}

# echo tipo: $decriptionType
