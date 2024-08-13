#!/bin/dash
#
# test8.sh: A testcase which use multiply.* lab
# 
#


Standard_output(){
    rm -rf .give
    2041 give-add lab2 multiply.sh multiply.autotests multiply.automarking
    2041 give-status z1234567|sed 's/@.* /@ /'
    2041 give-submit lab2 z1234567 multiply_wrong.sh|sed 's/@.* /@ /'
    2041 give-mark lab2|sed 's/@.* /@ /'
    2041 give-submit lab2 z1234567 multiply_right.py|sed 's/@.* /@ /'
    2041 give-mark lab2|sed 's/@.* /@ /'

}


My_output(){
    rm -rf .give
    ./give-add lab2 multiply.sh multiply.autotests multiply.automarking
    ./give-status z1234567 |sed 's/@.* /@ /'
    ./give-submit lab2 z1234567 multiply_wrong.sh |sed 's/@.* /@ /'
    ./give-mark lab2 |sed 's/@.* /@ /'
    ./give-submit lab2 z1234567 multiply_right.py|sed 's/@.* /@ /'
    ./give-mark lab2|sed 's/@.* /@ /'

}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my
if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 8 passed."
else
    echo "*** Test 8 failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
