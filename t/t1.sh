#!/bin/bash
## with set -e in force, I expect a loop to abandon the whole script if 
## a command inside the loop exits with non-zero.  In MSys, the loop
## exits, but the script continues to success.

function exit_handler 
{
    echo exit_status $?
    echo done
}
trap exit_handler EXIT

function nonzero_return_function
{
    return 1
}

set -e # exit on error
echo loop_entry

echo hello | while read a 
do
    nonzero_return_function || exit 1
    echo loop_continued
done

echo loop_exit $?

