#!/bin/dash
#
# test2.sh: Checking several input of give-summary command.
#
# This is the Sample Output:
# give-summary: give directory .give not found
# usage: give-summary
# directory .give created
# assignment lab10 created
# assignment lab10: submissions from 0 students
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# assignment lab10: submissions from 1 students
# assignment lab20 created
# assignment lab10: submissions from 1 students
# assignment lab20: submissions from 0 students
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# assignment lab10: submissions from 2 students
# assignment lab20: submissions from 0 students
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# assignment lab10: submissions from 2 students
# assignment lab20: submissions from 1 students


Standard_output(){
    rm -rf .give
    2041 give-summary
    2041 give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    2041 give-summary a
    2041 give-summary
    2041 give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-summary
    2041 give-add lab20 multiply_right.py multiply.autotests multiply.automarking
    2041 give-summary
    2041 give-submit lab10 z0000001 multiply.sh |sed 's/@.* /@ /'
    2041 give-summary
    2041 give-submit lab20 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-summary
}


My_output(){
    rm -rf .give
    ./give-summary
    ./give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    ./give-summary a
    ./give-summary
    ./give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-summary
    ./give-add lab20 multiply_right.py multiply.autotests multiply.automarking
    ./give-summary
    ./give-submit lab10 z0000001 multiply.sh |sed 's/@.* /@ /'
    ./give-summary
    ./give-submit lab20 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-summary
}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 2: give-summary passed."
else
    echo "*** Test 2: give-summary failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
