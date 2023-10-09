#!/bin/bash

FILE_NAME="$(date +'%d_%m_%y_%H_%M_%S').status"
touch "${FILE_NAME}"
exec 3>&1
{
echo "HOSTNAME = ${HOST}"
echo "TIMEZONE = ${TIME}"
echo "USER = $USER"
echo "OS = ${OS}"
echo "DATE = ${DATE}"
echo "UPTIME = ${UPTIME}"
echo "UPTIME_SEC = ${SEC}"
echo "IP = ${IP}"
echo "MASK = ${MASK}"
echo "GATEWAY = ${GW}"
echo "RAM_TOTAL = ${RTGB} GB"
echo "RAM_USED = ${RUGB} GB"
echo "RAM_FREE = ${RFGB} GB"
echo "SPACE_ROOT = ${SRMB} MB"
echo "SPACE_ROOT_USED = ${SRUMB} MB"
echo "SPACE_ROOT_FREE = ${SRFMB} MB"
}| tee -a "${FILE_NAME}"
echo "Do you want to save this to file (Y/N)"
read YN
if [ "${YN^^}" != "Y" ]; then
	rm "${FILE_NAME}"
fi


