#!/usr/bin/bash
echo "enter the  word"
read -s str
whitespace='                          '
j=1
if [[ $str =~ [A-Z] ]]
then
str=$(echo $str | tr [:upper:] [:lower:])
fi
echo "$str"
substr=$str
for((i=${#substr};i>0;i-=2))
do
substr="${substr:1:i-2}"
echo "${whitespace:0:j}""$substr"
j=$j+1
done
