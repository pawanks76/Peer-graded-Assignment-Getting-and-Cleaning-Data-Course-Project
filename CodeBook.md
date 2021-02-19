The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

Download the project dataset
Project Dataset was downloaded and unzipped 

Each table is read using read.table command and assigned to variables appropriately named.
Following are variables created
x_train, y_train, subject_train
x_test, y_test, subject_test
features. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals.
activityLabels

Column names were assigned to each

I. The training and the test sets were merged to create one data set using rbind and bind
X - 10299 rows, 561 columns 
Y - 10299 rows, 1 column
Subject - 10299 rows, 1 column
MergedData - 10299 rows, 563 column

II. Extracts only the measurements on the mean and standard deviation for each measurement
MeanStdData with 10299 rows, 88 columns was generated from by select command on subjectID and activityID. 

III. Uses descriptive activity names to name the activities in the data set
All columns of activityID column of MergedData were replaced with second column of activityLabels

IV. Appropriately labels the data set with descriptive variable names
Following replacements were made:
Acc to Accelerometer
Gyro to Gyroscope
BodyBody to Body
Mag to Magnitude
start of f to Frequency
start of t to Time

V. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
The dataset named 'SeconData' with 180 rows, 88 columns is created from MeanStdData using group_by and summerize_all functions.








