Peer-graded Assignment: Getting and Cleaning Data Course Project by PAWAN KUMAR.
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
This file provides detailed instruction on downloading unzipping and running analysis on the Dataset provide using RStudio.
The dataset is available for download at following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Following are the discription of analysis files-
run_analysis.R : 
	- reads and unzip the dataset
	- reads the tables
	- Assign the column names
	- Merges the training and the test sets
	- Extracts only the measurements on the mean and standard deviation for each measurement.
	- Uses descriptive activity names to name the activities in the data set.
	- Appropriately labels the data set with descriptive variable names.
	- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file named 'SecondData.txt' is created and exported contains avarages of each variable for each activity and each subject. 