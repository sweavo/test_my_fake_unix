#!/bin/bash
## In MSYS1, $() within a for expression does not propagate its return status
## to the outer shell.  I don't know if this is the case in all bashes.

function exit_handler 
{
    echo exit_status $?
    echo done
}
trap exit_handler EXIT

set -e # exit on error

source paths.source

(
    for x in $(wef bibble); do echo "hi"; done
    echo outer_bash_got: $?
)

