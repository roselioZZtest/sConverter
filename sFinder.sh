#!/bin/bash

echo "" > dotS_to_dotT_file.log

function addSymbolicLinktoSfile() {
for i in $(find . -type f -iname "*.s" | awk '{gsub ("./","");print}' | awk -F "." '{print$1}');
do
	ln -s $i.s $i.t
done
}

findThem=$(find . -type f -iname "*.s" | wc -l)
echo "Finding .s files..."; sleep 2s;

if [ `echo $findThem` -eq 0 ]
	then
		echo "Couldn't find .s files on the current directory, exiting..."; sleep 2s | tee -a dotS_to_dotT_file.log 
	else
	addSymbolicLinktoSfile()
	echo "creating link..."; sleep 2s | tee -a dotS_to_dotT_file.log
	echo "success!!!"; sleep 1s | tee -a dotS_to_dotT_file.log
fi