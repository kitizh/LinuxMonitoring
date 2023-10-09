#!/bin/bash

# 1st argument is num of main.sh parameters, 2nd is num of parameters we need to have

if (( $1 != $2 )); then
	echo "Illegal number of parameters"
else
	echo "var1=1" > correct.sh
	bash main.sh
fi
