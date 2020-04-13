#!/usr/bin/ bash

files_number=$( find . -maxdepth 1 -type f | wc -l )
#compare method
function CmpAnswer {
    if [[ $response -gt $files_number ]] ; then
        echo "Your guess is high."
        ReadAnswer
    else
        echo "Your guess is low."
        ReadAnswer
    fi
}
$Read Method
function ReadAnswer {
    read response
    while [[ ! $response =~ ^[0-9]+$ ]] ; 
    do
        echo "Enter another value - Try to match "
        read response
    done
}
echo "How many files in current directory ($(pwd))..."
ReadAnswer
while [[ $response -ne $files_number ]] ; do
    CmpAnswer
done
echo "Congratulations,you won"
exit 0
