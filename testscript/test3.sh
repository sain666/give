#!/bin/dash
#
# test3.sh: Checking several input of give-status command.
#
# This is the Sample Output:
# usage: give-status <zid>
# directory .give created
# assignment lab10 created
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# no submissions for z0000001
# * 1 submissions for lab10
# submission 1: multiply.sh 40 bytes @ 2024
# assignment lab20 created
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# * 1 submissions for lab10
# submission 1: multiply.sh 40 bytes @ 2024
# * 1 submissions for lab20
# submission 1: multiply.sh 40 bytes @ 2024
# Submission accepted - submission 2: multiply.sh 40 bytes @ 2024
# * 2 submissions for lab10
# submission 1: multiply.sh 40 bytes @ 2024
# submission 2: multiply.sh 40 bytes @ 2024
# * 1 submissions for lab20
# submission 1: multiply.sh 40 bytes @ 2024
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# * 1 submissions for lab10
# submission 1: multiply.sh 40 bytes @ 2024


Standard_output(){
    rm -rf .give
    2041 give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    2041 give-status
    2041 give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-status z0000001 |sed 's/@.* /@ /'
    2041 give-status z0000000 |sed 's/@.* /@ /'
    2041 give-add lab20 multiply_right.py multiply.autotests multiply.automarking
    2041 give-submit lab20 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-status z0000000 |sed 's/@.* /@ /'
    2041 give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-status z0000000 |sed 's/@.* /@ /'
    2041 give-submit lab10 z0000001 multiply.sh |sed 's/@.* /@ /'
    2041 give-status z0000001 |sed 's/@.* /@ /'
}


My_output(){
    rm -rf .give
    ./give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    ./give-status
    ./give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-status z0000001 |sed 's/@.* /@ /'
    ./give-status z0000000 |sed 's/@.* /@ /'
    ./give-add lab20 multiply_right.py multiply.autotests multiply.automarking
    ./give-submit lab20 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-status z0000000 |sed 's/@.* /@ /'
    ./give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-status z0000000 |sed 's/@.* /@ /'
    ./give-submit lab10 z0000001 multiply.sh |sed 's/@.* /@ /'
    ./give-status z0000001 |sed 's/@.* /@ /'
}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 3: give-status passed."
else
    echo "*** Test 3: give-status failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
