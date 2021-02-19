library("dplyr")
if(!file.exists("./week4data")){dir.create("./week4data")}

#Project Data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./week4data/Dataset.zip")

# Unzip dataSet
unzip(zipfile="./week4data/Dataset.zip",exdir="./week4data")

# Reading tables:

x_train <- read.table("./week4data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./week4data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./week4data/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./week4data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./week4data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./week4data/UCI HAR Dataset/test/subject_test.txt")

features <- read.table('./week4data/UCI HAR Dataset/features.txt')
activityLabels = read.table('./week4data/UCI HAR Dataset/activity_labels.txt')


#Assigment of column names:

colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

# 1. Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
MergedData <- cbind(Subject, Y, X)



# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
MeanStdData <- MergedData %>% select(subjectId, activityId, contains("mean"), contains("std"))


#3. Uses descriptive activity names to name the activities in the data set.

MeanStdData$activityId <- activityLabels[MeanStdData$activityId, 2]

#4. Appropriately labels the data set with descriptive variable names
names(MeanStdData)[2] = "activity"
names(MeanStdData)<-gsub("Acc", "Accelerometer", names(MeanStdData))
names(MeanStdData)<-gsub("Gyro", "Gyroscope", names(MeanStdData))
names(MeanStdData)<-gsub("BodyBody", "Body", names(MeanStdData))
names(MeanStdData)<-gsub("Mag", "Magnitude", names(MeanStdData))
names(MeanStdData)<-gsub("^t", "Time", names(MeanStdData))
names(MeanStdData)<-gsub("^f", "Frequency", names(MeanStdData))
names(MeanStdData)<-gsub("tBody", "TimeBody", names(MeanStdData))
names(MeanStdData)<-gsub("-mean()", "Mean", names(MeanStdData), ignore.case = TRUE)
names(MeanStdData)<-gsub("-std()", "STD", names(MeanStdData), ignore.case = TRUE)
names(MeanStdData)<-gsub("-freq()", "Frequency", names(MeanStdData), ignore.case = TRUE)
names(MeanStdData)<-gsub("angle", "Angle", names(MeanStdData))
names(MeanStdData)<-gsub("gravity", "Gravity", names(MeanStdData))

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

SecondData <- MeanStdData %>%
  group_by(subjectId,activity) %>%
  summarise_all(list(mean))

# Export data
write.table(SecondData, "SecondData.txt", row.names = F)
list.files()




