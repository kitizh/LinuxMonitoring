#!/bin/bash

export TIME1="$(date +%s%N)"

source correct.sh

export DIR=$1

if (($var1 == 0)); then
	bash check_num.sh $# 1 $@
else
	echo "var1=0" > correct.sh
	if [[ -d "${DIR}" ]]; then
		bash count.sh $@
	else
		echo "File does not exist"
	fi
fi

