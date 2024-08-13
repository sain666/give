#!/bin/dash
#
# test5.sh: Checking several input of give-autotest command.
#


Standard_output(){
    rm -rf .give
    2041 give-add lab10 hello.sh hello.autotests hello.automarking
    2041 give-add lab20 grep.sh grep.autotests grep.automarking
    2041 give-add lab30 answer.sh answer.autotests answer.automarking
    2041 give-add lab40 stderr.sh stderr.autotests stderr.automarking
    2041 give-autotest lab10 hello_wrong0.sh
    2041 give-autotest lab20 grep_wrong.sh
    2041 give-autotest lab30 answer_wrong.sh
    2041 give-autotest lab40 stderr_wrong.sh
    2041 give-autotest lab10 hello.sh
    2041 give-autotest lab20 grep.sh
    2041 give-autotest lab30 answer.sh
    2041 give-autotest lab40 stderr.sh
}


My_output(){
    rm -rf .give
    ./give-add lab10 hello.sh hello.autotests hello.automarking
    ./give-add lab20 grep.sh grep.autotests grep.automarking
    ./give-add lab30 answer.sh answer.autotests answer.automarking
    ./give-add lab40 stderr.sh stderr.autotests stderr.automarking
    ./give-autotest lab10 hello_wrong0.sh
    ./give-autotest lab20 grep_wrong.sh
    ./give-autotest lab30 answer_wrong.sh
    ./give-autotest lab40 stderr_wrong.sh
    ./give-autotest lab10 hello.sh
    ./give-autotest lab20 grep.sh
    ./give-autotest lab30 answer.sh
    ./give-autotest lab40 stderr.sh

}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 5: give-autotest passed."
else
    echo "*** Test 5: give-autotest failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
