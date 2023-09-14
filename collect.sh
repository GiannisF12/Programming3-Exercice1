#!/bin/bash

echo $1
lines=($(find /home/user/Desktop/$1 ))

if (( ${#lines[@]} )); then
	read -p "Change The Name of Directories? 1(Yes) or 2(No) : " change1

	if [ "$change1" = "1" ]
	then
		read -p "Name bin Directory : " bin
		read -p "Name src Directory : " src
		read -p "Name lib Directory : " lib
		read -p "Name inc Directory : " inc
	else
		bin="bin";
		src="src";
		lib="lib";
		inc="inc";
	fi

	read -p "Change the Recommended Name of .log file? 1(Yes) or 2(No) : " change2

	if [ "$change2" = "1" ]
	then
		read -p ".log File Name : " organize
	else
	organize="organize"
	fi

	touch /home/user/Desktop/"$organize".log

	mkdir $bin
	echo -e $bin "Folder Created!" >> /home/user/Desktop/"$organize".log

	mkdir $src
	echo -e $src "Folder Created!" >> /home/user/Desktop/"$organize".log

	mkdir $lib
	echo -e $lib "Folder Created!" >> /home/user/Desktop/"$organize".log

	mkdir $inc
	echo -e $inc "Folder Created!" >> /home/user/Desktop/"$organize".log

	find /home/user/Desktop/$1 \( -name "*executable*" \) -exec mv '{}' /home/user/Desktop/$bin/ \;
	find /home/user/Desktop/$1 \( -name "*.c" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.cc" \) -exec mv '{}' /home/user/Desktop/$src/ \;
	find /home/user/Desktop/$1 \( -name "*.hxx" -o -name "*.h" \) -exec mv '{}' /home/user/Desktop/$inc/ \;
	find /home/user/Desktop/$1 \( -name "*lib*" \) -exec mv '{}' /home/user/Desktop/$lib/ \;

fi
