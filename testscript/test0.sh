#!/bin/dash
#
# test0.sh: Checking several input of give-add command.
#
# This is the Sample Output:
# give-add: assignment lab1 already exists
# give-add: invalid assignment: L1
# give-add: not_exist: No such file or directory
# usage: give-add <assignment> <solution> <autotests> <automarking>
# give-add: invalid solution: ??
# directory .give created
# assignment lab1 created
# assignment lab2 created
# assignment lab3 created


Standard_output(){
    rm -rf .give
    touch ??
    2041 give-add lab1 multiply_right.py multiply.autotests multiply.automarking
    2041 give-add lab2 answer.sh answer.autotests answer.automarking
    2041 give-add lab3 grep.sh grep.autotests grep.automarking
    2041 give-add lab1 multiply_right.py multiply.autotests multiply.automarking
    2041 give-add L1 multiply_right.py multiply.autotests multiply.automarking
    2041 give-add lab4 not_exist multiply.autotests multiply.automarking
    2041 give-add lab4 multiply_right.py multiply.autotests
    2041 give-add lab4 ?? multiply.autotests multiply.automarking
    rm ??
}


My_output(){
    rm -rf .give
    touch ??
    ./give-add lab1 multiply_right.py multiply.autotests multiply.automarking
    ./give-add lab2 answer.sh answer.autotests answer.automarking
    ./give-add lab3 grep.sh grep.autotests grep.automarking
    ./give-add lab1 multiply_right.py multiply.autotests multiply.automarking
    ./give-add L1 multiply_right.py multiply.autotests multiply.automarking
    ./give-add lab4 not_exist multiply.autotests multiply.automarking
    ./give-add lab4 multiply_right.py multiply.autotests
    ./give-add lab4 ?? multiply.autotests multiply.automarking
    rm ??
}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 0: give-add passed."
else
    echo "*** Test 0: give-add failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
