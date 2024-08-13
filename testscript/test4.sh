#!/bin/dash
#
# test4.sh: Checking several input of give-fetch command.
#
# This is the Sample Output:
# give-fetch: assignment lab1 not found
# give-fetch: submission None not found for lab10
# directory .give created
# assignment lab10 created
# Submission accepted - submission 1: multiply.sh 40 bytes @ 2024
# #!/bin/dash
# a=$1
# read b
# echo $((a * b))
# Submission accepted - submission 2: answer.sh 47 bytes @ 2024
# #!/bin/dash
# echo The
# echo
# echo "answer is  42"
# Submission accepted - submission 3: grep.sh 22 bytes @ 2024
# #!/bin/dash
# echo The
# echo
# echo "answer is  42"
# #!/bin/dash
# a=$1
# read b
# echo $((a * b))
# #!/bin/dash
# grep "$@"

Standard_output(){
    rm -rf .give
    2041 give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    2041 give-fetch lab1 z0000000
    2041 give-fetch lab10 z0000000
    2041 give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    2041 give-fetch lab10 z0000000
    2041 give-submit lab10 z0000000 answer.sh |sed 's/@.* /@ /'
    2041 give-fetch lab10 z0000000
    2041 give-submit lab10 z0000000 grep.sh |sed 's/@.* /@ /'
    2041 give-fetch lab10 z0000000 -1
    2041 give-fetch lab10 z0000000 -2
    2041 give-fetch lab10 z0000000 3
}


My_output(){
    rm -rf .give
    ./give-add lab10 multiply_right.py multiply.autotests multiply.automarking
    ./give-fetch lab1 z0000000
    ./give-fetch lab10 z0000000
    ./give-submit lab10 z0000000 multiply.sh |sed 's/@.* /@ /'
    ./give-fetch lab10 z0000000
    ./give-submit lab10 z0000000 answer.sh |sed 's/@.* /@ /'
    ./give-fetch lab10 z0000000
    ./give-submit lab10 z0000000 grep.sh |sed 's/@.* /@ /'
    ./give-fetch lab10 z0000000 -1
    ./give-fetch lab10 z0000000 -2
    ./give-fetch lab10 z0000000 3
}


tmp_std=$(mktemp)
Standard_output > $tmp_std

tmp_my=$(mktemp)
My_output > $tmp_my

if diff $tmp_std $tmp_my >/dev/null; then
    echo "*** Test 4: give-fetch passed."
else
    echo "*** Test 4: give-fetch failed."
    echo "This is correct answer: "
    cat $tmp_std
    echo "This is yout answer: "
    cat $tmp_my
fi
