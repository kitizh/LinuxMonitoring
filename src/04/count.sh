#!/bin/bash

export HOST=$(hostname)
ZONE=$(timedatectl | grep 'Time zone' | awk -F ' ' '{print $3}')
UD=$(timedatectl | grep 'Time zone' | awk -F ' ' '{print $5}')
TI=$(timedatectl | grep 'Local time' | awk -F ' ' '{print $5}')
UD=${UD::5}
UDP=${UD::1}
UD1=${UD:1:1}
UD2=${UD:2:1}
UD3=${UD:3:1}
UD4=${UD:3:2}
if (($UD1 == 0)) && (($UD3 == 0)); then
	TIME=$(echo "${ZONE} UTC ${UDP}${UD2}")
elif (($UD1 == 0)) && (($UD3 != 0)); then
	TIME=$(echo "${ZONE} UTC ${UDP}${UD2}:${UD4}")
elif (($UD3 == 0)) && (($UD1 != 0)); then
	TIME=$(echo "${ZONE} UTC ${UDP}${UD1}${UD2}")
else
	TIME=$(echo "${ZONE} UTC ${UDP}${UD1}${UD2}:${UD4}")
fi
export TIME
export OS=$(cat /etc/os-release | grep 'PRETTY_NAME' | cut -c 14-31)
MONTH=$(date '+%B')
MONTH=${MONTH::3}
DATE1=$(date '+%d')
DATE2=$(date '+%Y')
export DATE=$(echo "${DATE1} ${MONTH} ${DATE2} ${TI}")
export SEC=$(awk '{print int($1)}' /proc/uptime)
export UPTIME=$(awk '{print int($1/3600)":"int(($1%3600)/60)":"int($1%60)}' /proc/uptime)
export IP=$(ip addr show enp0s3 | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')
export MASK=$(ifconfig enp0s3 | awk '/netmask/{print $4}')
export GW=$(ip route show | awk '/default/{split($3,a," "); print a[1]}')

RT=$(less /proc/meminfo | awk '/MemTotal:/{split($2,a,":"); printf a[1]}')
RF=$(less /proc/meminfo | awk '/MemFree:/{split($2,a,":"); printf a[1]}')
RU=$(expr ${RT} - ${RF})
SR=$(df / --output=size | sed -n 2p)
SRU=$(df / --output=used | sed -n 2p)
SRF=$(df / --output=avail | sed -n 2p)

CAP1="1048576"

export RTGB=$(bc<<<"scale=3;$RT/$CAP1")
export RFGB=$(bc<<<"scale=3;$RF/$CAP1")
export RUGB=$(bc<<<"scale=3;$RU/$CAP1")

CAP2="1024"

export SRMB=$(bc<<<"scale=2;$SR/$CAP2")
export SRUMB=$(bc<<<"scale=2;$SRU/$CAP2")
export SRFMB=$(bc<<<"scale=2;$SRF/$CAP2")
bash output.sh $1
