#!/bin/bash


FOL_NAME=($FOL_NAME)
FILE_NAME=($FILE_NAME)
EXE_NAME=($EXE_NAME)

echo "Total number of folders (including all nested ones) = ${FOL_NUM}"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"

for (( i = 0; i < 5; i++ )); do
	if (( ${i} < ${FOL_NUM} )); then
		FOL_SIZE[$i]=$(du -sh "${FOL_NAME[$i]}" | awk '{print $1}')
		echo "$(expr $i + 1) - ${FOL_NAME[$i]}, ${FOL_SIZE[$i]}"
	else
		echo "No more folders"
		break
	fi
done

echo "Total number of files = ${FILE_NUM}"
echo "Number of:"
echo "Configuration files (with the .conf extension) = ${CONF_NUM}"
echo "Text files = ${TEXT_NUM}"
echo "Executable files = ${EXE_NUM}"
echo "Log files (with extension .log) = ${LOG_NUM}"
echo "Archive files = ${ARC_NUM}"
echo "Symbolic links = ${LINK_NUM}"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

for (( i = 0; i < 10; i++ )); do
	if (( ${i} < ${FILE_NUM} )); then
		FILE_TYPE[$i]=$(file -b "${FILE_NAME[$i]}")
		FILE_SIZE[$i]=$(du -sh "${FILE_NAME[$i]}" | awk '{print $1}')
		echo "$(expr $i + 1) - ${FILE_NAME[$i]}, ${FILE_SIZE[$i]}, ${FILE_TYPE[$i]}"
	else
		echo "No more files"
		break
	fi
done

echo "TOP 10 executable files of the maximum size arranged in discending order (path, size and MD5 hash of file):"

for (( i = 0; i < 10; i++ )); do
	if (( $i < ${EXE_NUM} )); then
		EXE_HASH[$i]=$(md5sum "${EXE_NAME[$i]}" | awk '{print $1}')
		EXE_SIZE[$i]=$(du -sh "${EXE_NAME[$i]}" | awk '{print $1}')
		echo "$(expr $i + 1) - ${EXE_NAME[$i]}, ${EXE_SIZE[$i]}, ${EXE_HASH[$i]}"
	else
		echo "No more executable files"
		break
	fi
done

TIME2="$(date +%s%N)"

TIME="$(( $TIME2 - $TIME1 ))"

SEC=$( calc $TIME/1000000000 )

echo $(printf "Script execution time (in seconds) = %.2f\n" ${SEC})
