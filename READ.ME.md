---
title: "READ.ME.md"
author: "William D. Downs"
date: "September 24, 2014"
output: html_document
---

READ.ME
========

The script run_analysis takes as input the data set contained within the UCI_HAR_Dataset and generates as output a summary data.frame.  This output data.frame includes the mean and standard deviation for a collection of repeated movement measurements taken among 30 test subjects performing six different activities as measured by a Samsung Galaxy S II smartphone that each subject carries. 

The script run_analysis.R operates through a single function, run_analysis().  The function takes no arguments but it needs to be run within an environment containing the decompressed data set UCI_HAR_Dataset.  Data is selectively pulled (using read.table()) from files (.txt) of this dataset to build the function's output data.frame:  
UCI_HAR_Dataset/test/X_test.txt provides ~30% of the measurement means and standard deviations
UCI_HAR_Dataset/train/X_train.txt provide ~70% of the measurement means and standard deviations
UCI_HAR_Dataset/test/subject_test.txt and UCI_HAR_Dataset/train/subject_train provide the numbered designations of the test subjects for each measurement. 
UCI_HAR_Dataset/test/y_test.txt and UCI_HAR_Dataset/train/y_train provide the numbered designations of the activity (1-6) performed by the subject for each measurement.

As the output data.frame is built by the run_analysis() function, the columns are given meaningful labels.  (See Codebook for specific variable names.)  In the first column (i.e., "Activity"), the codes for the each of the activities (1-6) are translated into character labels:  "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", and "WALKING_UPSTAIRS" according to the factor data in the file UCI_HAR_Dataset/activity_labels.txt.  Finally, the rows of the data.frame are reordered by the function in increasing order by 1) the activity (alphabetically, first column "Activity") and 2) the test subject (numbered 1-30, second column "Subject"). 

