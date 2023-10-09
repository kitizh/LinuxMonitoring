#!/bin/bash

source correct.sh

error=0
if (($var1 == 0)); then
	bash check_num.sh $# 4 $@
else
	array=(1 2 3 4 5 6)
	re='^[0-9]'
	for param in $@; do
		if [[ "${param}" =~ $re ]]; then
			if [[ ! "${array[*]}" =~ "${param}" ]]; then
				echo "Wrong arguments"
				error=1
				break
			fi
		else
			echo "Illegal parametrs"
			error=1
			break
		fi
	done
	if (($error == 0)) && ((($1 == $2)) || (($3 == $4))); then
		echo "bacground and text colors are the same, run script again"
		error=1
	fi
	echo "var1=0" > correct.sh
	if (($error == 0)); then
	bash count.sh $@
	fi
fi

