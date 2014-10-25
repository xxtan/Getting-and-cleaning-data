## Getting and cleaning data 

This document will contain the instruction on how to use run_analysis.R file. 

# Description of run_analysis.R  
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Running run_analysis.R 
Step 1: 
Download the zip file which contains the data sets and unzip the file into working directory
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Step 2: 
Download run_analysis.R into the working directory. Make sure that run_analysis.R is in the parent folder of UCI HAR Dataset

Step 3: 
Run source("run_analysis.R") in Rstudio. 

# References
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


