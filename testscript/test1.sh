#!/bin/dash
#
# test1.sh: Checking several input of give-submit command.
#
# This is the Sample Output:
# give-submit: assignment lab99 not found
# give-submit: invalid zid: z00000000
# give-submit: not_exist: No such file or directory
# directory .give created
# assignment lab10 created
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# Submission accepted - submission 2: multiply.sh 40 bytes @ 2024
# Submission accepted - submission 3: multiply.sh 40 bytes @ 2024


Standard_output(){
    rm -rf .give
    2041 give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    2041 give-submit lab99 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-submit lab10 z00000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-submit lab10 z0000000 not_exist |sed 's/@.* /@ /'
    2041 give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
}


My_output(){
    rm -rf .give
    ./give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    ./give-submit lab99 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-submit lab10 z00000000 multiply.sh |sed 's/@.* /@ /'
    ./give-submit lab10 z0000000 not_exist |sed 's/@.* /@ /'
    ./give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 1: give-submit passed."
else
    echo "*** Test 1: give-submit failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
