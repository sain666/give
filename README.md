## Introduction

This is a project which implement functional versions of give and autotest. It includes 8 shell scripts named `give-add` `give-submit` `give-summary` `give-status` `give-fetch` `give-autotest` `give-mark` `give-rm`. It's feature match the behaviour of reference implementation(The real autotest application).

## Structure

The give commands will store information. It implement by creating a directory in the current directory named .give and creating files with it as needed.
- `give-add` command creates a new Give assignment.
- `give-submit` makes a submission for the assignment by a student.
- `give-summary` lists all assignments. with a count of how many students have made submissions.
- `give-status` lists all submissions a student has made.
- `give-fetch` outputs the contents of a submission the student has made.
- `give-autotest` runs the autotests for an assignment on a program.
- `give-mark` runs the automarking for an assignment on the last submission of each student.
- `give-rm` removes an assignment.

## Examples

```
ls -d .give
ls: cannot access '.give': No such file or directory
give-add lab1 multiply.sh multiply.autotests multiply.automarking
directory .give created
assignment lab1 created
ls -d .give
.give
give-add lab2 answer.sh answer.autotests answer.automarking
assignment lab2 created
give-submit lab1 z5000000 multiply_wrong.sh
Submission accepted - submission 1: multiply_wrong.sh 42 bytes @ Mon Aug 19 22:23:47 2024
give-submit lab1 z5000000 multiply_right.py
Submission accepted - submission 2: multiply_right.py 78 bytes @ Mon Aug 19 22:23:47 2024
give-submit lab2 z5000000 answer_wrong.sh
Submission accepted - submission 1: answer_wrong.sh 407 bytes @ Mon Aug 19 22:23:47 2024
give-submit lab2 z5111111 answer.sh
Submission accepted - submission 1: answer.sh 47 bytes @ Mon Aug 19 22:23:47 2024
give-summary
assignment lab1: submissions from 1 students
assignment lab2: submissions from 2 students
give-status z5111111
* 1 submissions for lab2
submission 1: answer.sh 47 bytes @ Mon Aug 19 22:23:47 2024
give-fetch lab1 z5000000
#!/usr/bin/python3
import sys
a=int(sys.argv[1])
b=int(input())
print(a * b)

give-autotest lab1 multiply_right.py
* Test test_a passed.
* Test test_b passed.
* Test test_c passed.
** 3 tests passed, 0 tests failed
give-mark lab1
*** Student z5000000 - submission 2: multiply_right.py 78 bytes @ Mon Aug 19 22:23:47 2024
* Test marking1 passed (10 marks).
* Test marking2 passed (30 marks).
* Test marking3 passed (20 marks).
* Test marking4 passed (42 marks).
** 4 tests passed, 0 tests failed - mark: 102/102
give-add lab1 grep.sh grep.autotests grep.automarking
give-add: assignment lab1 already exists
give-rm lab1
assignment lab1 removed
give-add lab1 grep.sh grep.autotests grep.automarking
assignment lab1 created
```
**Mark**: 87.1/100 (High Distinction)

