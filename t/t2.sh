#!/bin/bash
## In MSys bash, if you delete a file that another process is holding, windows 
## will like to MSys that the file is deleted, but then you cannot create a new
## file with the same name.

function exit_handler 
{
    echo exit_status $?
    echo done
}
trap exit_handler EXIT

set -e # exit on error

TMPFILE=$(mktemp _run_t2XXXXX)

echo holding
( echo one; sleep 10; echo two ) > $TMPFILE &

sleep 1
echo removing
rm $TMPFILE 
echo "rm returned $?"
sleep 1
echo rewriting
echo hi > $TMPFILE
echo "echo with redirect returned $?"

