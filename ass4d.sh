#!/usr/bin/bash
read -p "enter the word" string
whitespace='                          '
reverse(){
if [[ $string =~ [A-Z] && $string =~ ^[[:upper:]]+$ ]]
then
string=$(echo $string | tr [:upper:] [:lower:])
elif [[ $string =~ [a-z] ]]
then
read -p "enter the word in upper case only:" string
reverse
fi
}
reverse
string1=$string
for((i=${#string1};i>1;i-=1))
do
if [[ $i == ${#string1} ]]
then
string4="${string1:i-1:1}"
echo "${whitespace:0:i-1}""$string4"
else
string4="${string1:i-1:(${#string1}+1)}"
for((p=${#string4};p>1;p-=1))
do
string5="${string4:p-2:1}"
string6=$string6$string5
done
echo "${whitespace:0:i-1}""$string4""$string6"
fi
string6=""
done
k=0
for((i=${#string};i>0;i-=1))
do
        string3=""
        if [[ $i == ${#string} ]]
        then
                string1="${string:0:i}"
                for((j=${#string1};j>1;j-=1))
                do
                        string2="${string1:j-2:1}"
                        string3=$string3$string2
                done
        else
                string1="${string:1:(${#string}-2)}"
        fi
        echo "${whitespace:0:$k}""$string1""$string3"
        string=$string1$string3
        k=$k+1
done
