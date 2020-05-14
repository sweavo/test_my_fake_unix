#!/bin/bash
## In unix world, the culture is to fork() processess a lot, so it has been 
## made very lightweight.  In windows, you CreateProcess, which is heavier.  In
## order to simulate fork() on windows, you CreateProcess, then duplicate the 
## current process in case you weren't about to exec() next, then, typically, 
## the caller exec()s next.  Let's see how fast I can create 100 subshells on 
## this machine.

function exit_handler 
{
    echo exit_status $?
    echo done
}
trap exit_handler EXIT

set -e # exit on error

time for x in $(seq 1 100)
do
    echo 'hello' | sed 's/e/a/;s/o/ee/' >/dev/null
done

