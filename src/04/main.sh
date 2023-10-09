#!/bin/bash

source correct.sh

error=0
if (($var1 == 0)); then
	bash check_num.sh $# 0
else
	echo "var1=0" > correct.sh
	bash count.sh $@
fi

