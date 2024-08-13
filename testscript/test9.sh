#!/bin/dash
#
# test9.sh: Running all the test[0-8].sh.
#

Run_All_Test(){
    ./test0.sh
    ./test1.sh
    ./test2.sh
    ./test3.sh
    ./test4.sh
    ./test5.sh
    ./test6.sh
    ./test7.sh
    ./test8.sh
}


Run_All_Test 2>/dev/null
