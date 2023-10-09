#!/bin/bash

source correct.txt

if (($var1 == 0)); then
	bash check_num.sh $# 1 $@
fi

if (($var1 == 1)); then
	re='^[+-]?[0-9]+([.][0-9]+)?$'
	if ! [[ $1 =~ $re ]] ; then
		echo $1
	else
		echo "It is a number"
	fi
	echo "var1=0" > correct.txt
fi
