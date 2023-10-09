#!/bin/bash

export FOL_NAME="$(du -h ${DIR} | sort -hr | head -5 | awk '{print $2}')"
export FOL_NUM="$(find ${DIR} -type d | wc -l)"
export FILE_NUM="$(ls -laR ${DIR} | grep '^-' | wc | awk '{print $1}')"
export CONF_NUM="$(find ${DIR} -type f -name '*.conf' | wc -l)"
export TEXT_NUM="$(find ${DIR} -type f -exec grep -Il . {} + | wc -l)"
export EXE_NUM="$(find ${DIR} -type f -executable -print | wc -l)"
export LOG_NUM="$(find ${DIR} -type f -name '*.log' | wc -l)"
export ARC_NUM="$(find ${DIR} -type f -exec sh -c 'file -zb "$1" | grep -q "archive"' _ {} \; -print | wc -l)"
export LINK_NUM="$(find ${DIR} -type l | wc -l)"
export FILE_NAME="$(find ${DIR} -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')"
export EXE_NAME="$(find ${DIR} -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')"

bash output.sh
