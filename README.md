Analysis of the UCI HAR dataset
===============================

This repository contains a script which cleans the UCI HAR dataset, and outputs a version which contains means of the average and standard deviation statistics from measurements in that data set, grouped by test subject and the activity they were performing.

For information about the source of the original data set and a description of fields used and output in this analysis see CodeBook.md.

Running the analysis
--------------------

First run download.R, which will download the data file and extract it to a folder called "UCI HAR Dataset/". This folder should contain the raw UCI HAR data.

Then run "run_analysis.R"

This will output a file "output.txt" to the current directory.

Coursera
--------

Note that this is my answer to a Coursera Programming Assignment on the Getting and Cleaning Data course. See https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3 for more details.
