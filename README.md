# Getting-and-Cleaning-Data-Course-Project
Coursera Project
======================================

This project is part of the course project from Getting & Cleaning Data from Coursera. It makes use of the dataset obtain from wearing smart phone. It is separated into two sets, training and test , both with correspondent folders. 

In the run_analysis.R scripts read both datasets merging together and use the activity_labels.txt to indentify each activity of the training from each datasets. For the analysis the mean and standard deviation from the X_train.txt and X_test.txt are done per row. Once we have done the analysis in both datasets, they are combine with the subject and activity to get the consolidated data. This table is mmerge with activity_labels to translate each activity, the resultant data set contains 10299 observations ( 2947 from test and 7352 from  training)

Finally with the resultant table, it is summarized by subject and activity performing the average of each observation. This is the output of the run_analysis.R script that has been submitted to the course project in form of a table.

NOTE
=========================================
THis script needs to be run with the working directory being the UCI HAR Dataset folder where the data is located. 

The output table contains the following variables :
=========================================
- ActivityName : the name of the activity that was perform by the subject during the training or testing. 
- Subject : indetify the person from which measurements are taking when they perform the experiment. In total 30 person identify by a unique ID number.
- meanX : mean value from the test & training set, done per row of the X_test and X_train files. Average value for each subject and activity is calculated and display in this variable 
- meanStdX : standard deviation from the test & training set, done per row of the X_test and X_train files. Average value for each subject and activity is calculated and display in this variable 

