Analysis of the UCI HAR dataset
===============================

This repository contains a script which cleans the UCI HAR dataset, and outputs a version which contains means of the average and standard deviation statistics from measurements in that data set, grouped by test subject and the activity they were performing.

For information about the source of the original data set and a description of fields used and output in this analysis see CodeBook.md.

Running the analysis
--------------------

First run download.R, which will download the data file and extract it to a folder called "UCI HAR Dataset/". This folder should contain the raw UCI HAR data.

Then run "run_analysis.R"

This will output a file "output.txt" to the current directory.

How it works
------------
The run analysis script has a number of functions which are applied to the training and testing sets:

* load_file (reads the raw files as a table, and applied labels from the features.txt file in the dataset folder, and extracts the required columns)
* add_activty (uses the meta data file in the data set to translate the content of the Y file, which represents activity, and puts the translated label into the activity column of the data set passed)
* add_subject (adds the subject column from a separate file in the dataset folder)

These functions are called in order to process the training and test sets. They are then combined into the "all" set with rbind.

The desired result set is then built with the melt and dcast functions from the reshape2 library, and saved to output.txt in the working directory. 


Coursera
--------

Note that this is my answer to a Coursera Programming Assignment on the Getting and Cleaning Data course. See https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3 for more details.
