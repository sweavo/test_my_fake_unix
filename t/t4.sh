#!/bin/bash
## early WSL could not execute windows programs, at least that's what I heard.
## meanwhile, MSys interprets /? to be a path and attempts to convert it to a 
## windows path.

function exit_handler 
{
    echo exit_status $?
    echo done
}
trap exit_handler EXIT

set -e # exit on error

source paths.source

$SYSTEM32_DIR/clip /? 2>&1

