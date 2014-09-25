---
title: "CodeBook.md"
author: "William D. Downs"
date: "September 24, 2014"
output: html_document
---

CODEBOOK
==========

The script run_analysis takes as input the data set contained within the UCI_HAR_Dataset and generates as output a summary data.frame.  This output data.frame includes the mean and standard deviation for a collection of repeated movement measurements taken among 30 test subjects performing six different activities as measured by a Samsung Galaxy S II smartphone that each subject carries.  

VARIABLES OF THE OUTPUT DATA.FRAME
Activity:  The action performed by the subject while the measurement was taken.  
               LAYING, SiTTING, STANDING, WALKING, WALKING_DOWNSTAIRS, 
               WALKING_UPSTAIRS
Subject:  Designates the subject (1-30) that provided the measure

Each of the following means and standard deviations is based on 128 measurements of a single subject (see above)  performing a single activity (see above).  Each value is expressed as a multiple of g, the gravitational acceleration constant. 
BodyAccXMean:  The mean of measurements of body acceleration (minus gravity) along the X-axis
BodyAccYMean:  The mean of measurements of body acceleration (minus gravity) along the Y-axis
BodyAccZMean:  The mean of measurements of body acceleration (minus gravity) along the Z-axis
BodyAccXStd:  The standard deviation of measurements of body acceleration (minus gravity) 
    		    along the X-axis
BodyAccYStd:  The standard deviation of measurements of body acceleration (minus gravity) 
			    along the Y-axis
BodyAccZStd:  The standard deviation of measurements of body acceleration (minus gravity) 
			    along the Z-axis
BodyGyroXMean:  The mean of the gyroscopic measurements of angular velocity along the X-axis
BodyGyroYMean:  The mean of the gyroscopic measurements of angular velocity along the Y-axis
BodyGyroZMean:  The mean of the gyroscopic measurements of angular velocity along the Z-axis
BodyGyroXStd:  The standard deviation of the gyroscopic measurements of angular velocity along 
			    the X-axis
BodyGyroYStd:  The standard deviation of the gyroscopic measurements of angular velocity along 
			    the Y-axis
BodyGyroZStd:  The standard deviation of the gyroscopic measurements of angular velocity along 
			    the Z-axis
TotalAccXMean:  The mean of measurements of the total acceleration along the X-axis
TotalAccYMean:  The mean of measurements of the total acceleration along the Y-axis
TotalAccZMean:  The mean of measurements of the total acceleration along the Z-axis
TotalAccXStd:  The standard deviation of measurements of the total acceleration along the 
                X-axis
TotalAccYStd:  The standard deviation of measurements of the total acceleration along the 
                Y-axis
TotalAccZStd:  The standard deviation of measurements of the total acceleration along the 
                Z-axis

DATA AND TRANSFORMATIONS TO CLEAN THE DATA:  
The script run_analysis.R contains a single function [run_analysis()] which combines data from two collections within the UCI_HAR_Dataset:  test data and training data.  The mean and standard deviation values are selectively pulled from the UCI_HAR_Dataset/test/X_test.txt and UCI_HAR_Dataset/train/X_train.txt files.  The assignment of test subjects (1-30) to each measurement utilized data within the files UCI_HAR_Dataset/test/subject_test.txt and UCI_HAR_Dataset/train/subject_train.  The activities carried out by the subject in each measurement was codified in the files UCI_HAR_Dataset/test/y_test.txt and UCI_HAR_Dataset/train/y_train.txt.  The activity codes (1-6) were converted to character labels:  "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", and "WALKING_UPSTAIRS".After assembling into a data.frame these data the rows are reordered by the function in increasing order by 1) the activity (alphabetically) and 2) the test subject (numbered 1-30). 

