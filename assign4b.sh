#!/bin/bash

read -p "Enter a word: " word
read -p "Enter upper case or lower case (U/L): " case_type



if [[ $case_type == "U" ]]; then
    word=$(echo "$word" | tr '[:lower:]' '[:upper:]')
else
    word=$(echo "$word" | tr '[:upper:]' '[:lower:]')
fi



length=${#word}



# Reverse Pyramid
for ((i=$length; i>=1; i--))
do
    echo "${word:0:i}"
done
 echo
                                                                                                                                    1,1           Top
