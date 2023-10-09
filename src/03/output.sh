#!/bin/bash

COL[0]=$1
COL[1]=$2
COL[2]=$3
COL[3]=$4
i=0

WHI_T='\e[97m'
RED_T='\e[31m'
GRE_T='\e[32m'
BLU_T='\e[94m'
PUR_T='\e[35m'
BLA_T='\e[30m'

WHI_B='\e[107m'
RED_B='\e[41m'
GRE_B='\e[42m'
BLU_B='\e[104m'
PUR_B='\e[45m'
BLA_B='\e[40m'

E_C='\e[0m'
for C in ${COL[@]}; do
	if [[ ${C} -eq "1" ]]; then
		if [[ i%2 -eq 1 ]]; then
			COL[i]=$WHI_T
		else
			COL[i]=$WHI_B
		fi
	elif [[ ${C} -eq "2" ]]; then
		if [[ i%2 -eq 1 ]]; then
			COL[i]=$RED_T
		else
			COL[i]=$RED_B
		fi
	elif [[ ${C} == "3" ]]; then
		if [[ i%2 -eq 1 ]]; then
			COL[i]=$GRE_T
		else
			COL[i]=$GRE_B
		fi
	elif [[ ${C} == "4" ]]; then
		if [[ i%2 -eq 1 ]]; then
			COL[i]=$BLU_T
		else
			COL[i]=$BLU_B
		fi
	elif [[ ${C} == "5" ]]; then
		if [[ i%2 -eq 1 ]]; then
			COL[i]=$PUR_T
		else
			COL[i]=$PUR_B
		fi
	elif [[ ${C} == "6" ]]; then
		if [[ i%2 -eq 1 ]]; then
			COL[i]=$BLA_T
		else
			COL[i]=$BLA_B
		fi
	fi
	i=$i+1
done

echo -e "${COL[0]}${COL[1]}HOSTNAME${E_C} = ${COL[2]}${COL[3]}${HOST}${E_C}"
echo -e "${COL[0]}${COL[1]}TIMEZONE${E_C} = ${COL[2]}${COL[3]}${TIME}${E_C}"
echo -e "${COL[0]}${COL[1]}USER${E_C} = ${COL[2]}${COL[3]}$USER${E_C}"
echo -e "${COL[0]}${COL[1]}OS${E_C} = ${COL[2]}${COL[3]}${OS}${E_C}"
echo -e "${COL[0]}${COL[1]}DATE${E_C} = ${COL[2]}${COL[3]}${DATE}${E_C}"
echo -e "${COL[0]}${COL[1]}UPTIME${E_C} = ${COL[2]}${COL[3]}${UPTIME}${E_C}"
echo -e "${COL[0]}${COL[1]}UPTIME_SEC${E_C} = ${COL[2]}${COL[3]}${SEC}${E_C}"
echo -e "${COL[0]}${COL[1]}IP${E_C} = ${COL[2]}${COL[3]}${IP}${E_C}"
echo -e "${COL[0]}${COL[1]}MASK${E_C} = ${COL[2]}${COL[3]}${MASK}${E_C}"
echo -e "${COL[0]}${COL[1]}GATEWAY${E_C} = ${COL[2]}${COL[3]}${GW}${E_C}"
echo -e "${COL[0]}${COL[1]}RAM_TOTAL${E_C} = ${COL[2]}${COL[3]}${RTGB} GB${E_C}"
echo -e "${COL[0]}${COL[1]}RAM_USED${E_C} = ${COL[2]}${COL[3]}${RUGB} GB${E_C}"
echo -e "${COL[0]}${COL[1]}RAM_FREE${E_C} = ${COL[2]}${COL[3]}${RFGB} GB${E_C}"
echo -e "${COL[0]}${COL[1]}SPACE_ROOT${E_C} = ${COL[2]}${COL[3]}${SRMB} MB${E_C}"
echo -e "${COL[0]}${COL[1]}SPACE_ROOT_USED${E_C} = ${COL[2]}${COL[3]}${SRUMB} MB${E_C}"
echo -e "${COL[0]}${COL[1]}SPACE_ROOT_FREE${E_C} = ${COL[2]}${COL[3]}${SRFMB} MB${E_C}"


