## Introduction

This is a project which implement simple but functional versions of give and autotest. It includes 8 shell scripts named give-add give-submit give-summary give-status give-fetch give-autotest give-mark give-rm.
It's feature must match the behaviour of reference implementation(The real autotest application).

## structure

The give commands will store information. It implement by creating a directory in the current directory named .give and creating files with it as needed.
`give-add` command creates a new Give assignment.
`give-submit` makes a submission for the assignment by a student.
`give-summary` lists all assignments. with a count of count of how many students have made submissions.
`give-status` lists all submissions a student has made.
`give-fetch` outputs the contents of a submission the student has made.
`give-autotest` runs the autotests for an assignment on a program.
`give-mark` runs the automarking for an assignment on the last submission of each student.
`give-rm` removes an assignment.

## Scores

- **Overall**: 87.1/100 (High Distinction)

