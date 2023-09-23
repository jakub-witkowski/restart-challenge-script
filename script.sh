#!/bin/bash
#Script for AWS Re/Start Challenge Lab 21 Sep 2023 by Jakub Witkowski
#This script creates 25 empty files with a prefix "JW" each time it is run

counter=`find . -name "JW_*.txt" -type f | wc -l`
echo "$counter files found"
highest_file_number=1
files_checking_in_progress=1
echo "highest file number: $highest_file_number"

if [ "$counter" -eq "0" ]
	then
	echo "Creating 25 files"
	for x in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
	do
		touch JW_$x.txt
	done
else
	while (("$files_checking_in_progress" == 1))
	do
		test -e JW_$highest_file_number.txt
		if [ "$?" -eq "0" ]
			then
			((highest_file_number++))
		else
			for y in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
			do
				touch JW_$(($highest_file_number+$y)).txt
			done
			files_checking_in_progress=0
		fi
	done
fi
