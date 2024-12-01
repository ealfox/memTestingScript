#!/bin/bash

# instructions for future myself:
# run this script in the directory with your exec file
# change DIR to path to the directory with test files and EXECUTABLE surprisingly to the name of your exec file

# this script assumes a directory with tests in the format that progtest uses, if you have a dir with input files 
# only or different naming convention, change  "${DIR}/*_in.txt" to whatever you need in the for loop

DIR="DIR_PATH"
EXECUTABLE="EXEC_NAME"

for INPUT_FILE in ${DIR}/*_in.txt
do
	echo $INPUT_FILE
	echo '------------------'
	valgrind ./$EXECUTABLE < $INPUT_FILE 2> tmp
	echo '------------------'
	cat tmp | grep -e "bytes" -e "ERROR"
	succ=$(cat tmp | grep "All heap blocks were freed")
	NC="\033[0m" 
	GREEN="\033[0;42m" 
	printf "${GREEN}${succ}${NC}"

	printf "\n\n"
done
rm tmp
