#!/bin/bash

source config.sh
if [[ -z $column1_background ]] || [[ -z $column1_font_color ]] || [[ -z $column2_background ]] || [[ -z $column2_font_color ]]; then
	COL=(1 0 1 0)
else
	COL[0]=$column1_background

	COL[1]=$column1_font_color

	COL[2]=$column2_background

	COL[3]=$column2_font_color


fi
i=0

N1=${COL[0]}
N2=${COL[1]}
N3=${COL[2]}
N4=${COL[3]}

WHI_T='\e[97m'
WHI='(white)'
RED_T='\e[31m'
RED='(red)'
GRE_T='\e[32m'
GRE='(green)'
BLU_T='\e[94m'
BLU='(blue)'
PUR_T='\e[35m'
PUR='(purple)'
BLA_T='\e[30m'
BLA='(black)'

WHI_B='\e[107m'
RED_B='\e[41m'
GRE_B='\e[42m'
BLU_B='\e[104m'
PUR_B='\e[45m'
BLA_B='\e[40m'

E_C='\e[0m'

array=(1 2 3 4 5 6)
error=0
error2=0
re='^[0-9]'
NA=(${WHI} ${RED} ${BLA} ${PUR})
for param in ${COL[@]}; do
	if [[ "${param}" =~ $re ]]; then
		if [[ ! "${array[*]}" =~ "${param}" ]]; then
			error=1
		fi
	else
		error=1
		break
	fi
done

if [[ ${error} -eq 0 ]]; then
	if [[ "${COL[0]}" -eq "${COL[1]}" ]] || [[ "${COL[2]}" -eq "${COL[3]}" ]]; then
		error2=1
	fi
fi

if [[ ${error} -eq 1 ]] || [[ ${error2} -eq 1 ]]; then
	COL[0]=$WHI_B
	COL[1]=$RED_T
	COL[2]=$BLA_B
	COL[3]=$PUR_T
	N1='default'
	N2='default'
	N3='default'
	N4='default'
else
	for C in ${COL[@]}; do
		if [[ ${C} -eq "1" ]]; then
			NA[i]=$WHI
			if [[ i%2 -eq 1 ]]; then
				COL[i]=$WHI_T
			else
				COL[i]=$WHI_B
			fi
		elif [[ ${C} -eq "2" ]]; then
			NA[i]=$RED
			if [[ i%2 -eq 1 ]]; then
				COL[i]=$RED_T
			else
				COL[i]=$RED_B
			fi
		elif [[ ${C} == "3" ]]; then
			NA[i]=$GRE
			if [[ i%2 -eq 1 ]]; then
				COL[i]=$GRE_T
			else
				COL[i]=$GRE_B
			fi
		elif [[ ${C} == "4" ]]; then
			NA[i]=$BLU
			if [[ i%2 -eq 1 ]]; then
				COL[i]=$BLU_T
			else
				COL[i]=$BLU_B
			fi
		elif [[ ${C} == "5" ]]; then
			NA[i]=$PUR
			if [[ i%2 -eq 1 ]]; then
				COL[i]=$PUR_T
			else
				COL[i]=$PUR_B
			fi
		elif [[ ${C} == "6" ]]; then
			NA[i]=$BLA
			if [[ i%2 -eq 1 ]]; then
				COL[i]=$BLA_T
			else
				COL[i]=$BLA_B
			fi
		fi
		i=$i+1
	done
fi

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
echo -e ""
echo -e "Column 1 background = ${N1} ${NA[0]}"
echo -e "Column 1 font color = ${N2} ${NA[1]}"
echo -e "Column 2 background = ${N3} ${NA[2]}"
echo -e "Column 2 font color = ${N4} ${NA[3]}"

