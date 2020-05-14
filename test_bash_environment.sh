#!/bin/bash

overall_pass=true

function fail {
    printf -- '-- FAIL ------------------------\n'
    overall_pass=false
}

function pass {
    printf -- '-- OK --------------------------\n'
}
 
function start_test {
    printf -- '================================\n%s\n' "$*"
}

function check {
    printf -- '--------------------------------\ncheck: %s\n' "$*"
    if "$@"
    then
        pass
    else
        fail
    fi
}


TMP_FLD=$(mktemp -d _runXXXXX)

start_test "loop status check"

sed '/^##/!d' t/t1.sh

t/t1.sh > $TMP_FLD/t1.out

check diff t/t1.expected $TMP_FLD/t1.out 

start_test Summary
if $overall_pass
then
    pass
else
    fail
    exit 1
fi
