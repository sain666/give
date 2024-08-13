#!/bin/dash
#
# test7.sh: Checking several input of give-rm command.
#
# This is the Sample Output:
# directory .give created
# assignment lab10 created
# assignment lab20 created
# assignment lab30 created
# assignment lab40 created
# assignment lab10: submissions from 0 students
# assignment lab20: submissions from 0 students
# assignment lab30: submissions from 0 students
# assignment lab40: submissions from 0 students
# assignment lab10 removed
# assignment lab20: submissions from 0 students
# assignment lab30: submissions from 0 students
# assignment lab40: submissions from 0 students
# assignment lab20 removed
# assignment lab30: submissions from 0 students
# assignment lab40: submissions from 0 students
# assignment lab30 removed
# assignment lab40: submissions from 0 students
# assignment lab40 removed
# no assignments


Standard_output(){
    rm -rf .give
    2041 give-add lab10 hello.sh hello.autotests hello.automarking
    2041 give-add lab20 grep.sh grep.autotests grep.automarking
    2041 give-add lab30 answer.sh answer.autotests answer.automarking
    2041 give-add lab40 stderr.sh stderr.autotests stderr.automarking
    2041 give-summary
    2041 give-rm lab10
    2041 give-summary
    2041 give-rm lab20
    2041 give-summary
    2041 give-rm lab30
    2041 give-summary
    2041 give-rm lab40
    2041 give-summary
}


My_output(){
    rm -rf .give
    ./give-add lab10 hello.sh hello.autotests hello.automarking
    ./give-add lab20 grep.sh grep.autotests grep.automarking
    ./give-add lab30 answer.sh answer.autotests answer.automarking
    ./give-add lab40 stderr.sh stderr.autotests stderr.automarking
    ./give-summary
    ./give-rm lab10
    ./give-summary
    ./give-rm lab20
    ./give-summary
    ./give-rm lab30
    ./give-summary
    ./give-rm lab40
    ./give-summary
}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 7: give-rm passed."
else
    echo "*** Test 7: give-rm failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
