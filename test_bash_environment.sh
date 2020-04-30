#!/bin/bash

function start_test {
    printf -- '================================\n%s\n' "$*"
}

function check {
    printf -- '--------------------------------\ncheck: %s\n' "$*"
    if "$@"
    then
        printf -- '-- OK --------------------------\n'
    else
        printf -- '-- FAIL ------------------------\n'
    fi
}


TMP_FLD=$(mktemp -d _runXXXXX)

start_test "loop status check"

t/t1.sh > $TMP_FLD/t1.out

check diff t/t1.expected $TMP_FLD/t1.out 

