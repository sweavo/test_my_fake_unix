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
    printf -- '================================\n%s\n--------------------------------\n' "$*"
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

for test_script in $(cd t; ls t*.sh)
do
    test=${test_script%.sh} 
    start_test t/"$test"
    sed '/^##/!d' t/"$test".sh
    t/"$test".sh > $TMP_FLD/$test.out
    check diff t/"$test".expected $TMP_FLD/"$test".out 
done

start_test Summary
if $overall_pass
then
    pass
else
    fail
    exit 1
fi

