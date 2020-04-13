#!/bin/bash
#
# Rename all files and folders to lowercase recursively
#
# https://stackoverflow.com/questions/152514/how-do-i-rename-all-folders-and-files-to-lowercase-on-linux

for SRC in $(find . -depth)
do
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo "${SRC} was not renamed"
    fi
done
