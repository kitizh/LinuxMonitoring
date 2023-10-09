#!/bin/bash

# 1st argument is num of main.sh parameters, 2nd is num of parameters we need to have
# 3rd is all main.sh parameters

if (( $1 != $2 )); then
	echo "Illegal number of parameters"
else
	if [[ "${3: -1}" != "/" ]]; then
		echo "Path is incorrect"
	else
		echo "var1=1" > correct.sh
		bash main.sh ${@:3}
	fi
fi
