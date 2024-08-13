#!/bin/dash
#
# test6.sh: Checking several input of give-mark command.
#

Standard_output(){
    rm -rf .give
    2041 give-add lab10 hello.sh hello.autotests hello.automarking
    2041 give-add lab20 grep.sh grep.autotests grep.automarking
    2041 give-add lab30 answer.sh answer.autotests answer.automarking
    2041 give-add lab40 stderr.sh stderr.autotests stderr.automarking
    2041 give-submit lab10 z0000000 hello.sh |sed 's/@.* /@ /'
    2041 give-submit lab20 z0000000 grep.sh |sed 's/@.* /@ /'
    2041 give-submit lab30 z0000000 answer.sh |sed 's/@.* /@ /'
    2041 give-submit lab40 z0000000 stderr.sh |sed 's/@.* /@ /'
    2041 give-submit lab10 z0000001 hello_wrong0.sh |sed 's/@.* /@ /'
    2041 give-submit lab20 z0000001 grep_wrong.sh |sed 's/@.* /@ /'
    2041 give-submit lab30 z0000001 answer_wrong.sh |sed 's/@.* /@ /'
    2041 give-submit lab40 z0000001 stderr_wrong.sh |sed 's/@.* /@ /'
    2041 give-mark lab10 |sed 's/@.* /@ /'
    2041 give-mark lab20 |sed 's/@.* /@ /'
    2041 give-mark lab30 |sed 's/@.* /@ /'
    2041 give-mark lab40 |sed 's/@.* /@ /'
}


My_output(){
    rm -rf .give
    ./give-add lab10 hello.sh hello.autotests hello.automarking
    ./give-add lab20 grep.sh grep.autotests grep.automarking
    ./give-add lab30 answer.sh answer.autotests answer.automarking
    ./give-add lab40 stderr.sh stderr.autotests stderr.automarking
    ./give-submit lab10 z0000000 hello.sh |sed 's/@.* /@ /'
    ./give-submit lab20 z0000000 grep.sh |sed 's/@.* /@ /'
    ./give-submit lab30 z0000000 answer.sh |sed 's/@.* /@ /'
    ./give-submit lab40 z0000000 stderr.sh |sed 's/@.* /@ /'
    ./give-submit lab10 z0000001 hello_wrong0.sh |sed 's/@.* /@ /'
    ./give-submit lab20 z0000001 grep_wrong.sh |sed 's/@.* /@ /'
    ./give-submit lab30 z0000001 answer_wrong.sh |sed 's/@.* /@ /'
    ./give-submit lab40 z0000001 stderr_wrong.sh |sed 's/@.* /@ /'
    ./give-mark lab10 |sed 's/@.* /@ /'
    ./give-mark lab20 |sed 's/@.* /@ /'
    ./give-mark lab30 |sed 's/@.* /@ /'
    ./give-mark lab40 |sed 's/@.* /@ /'
}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 6: give-mark passed."
else
    echo "*** Test 6: give-mark failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
