# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 
#

library(data.table)
library(dplyr)
library(plyr)
library(reshape)


## Read labels etc

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")

## Read test data
subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt")

X_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test_data <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Y_test_data[,2] <- activity_labels[Y_test_data[,1]]
colnames(X_test_data) <- features$V2
test_data_all <- cbind(Y_test_data$V2,X_test_data)
setnames(test_data_all,"Y_test_data$V2","activity")
test_data_all <- cbind(subject_test_data,test_data_all)
setnames(test_data_all,"V1","subjectid")



## Read training data
subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train_data <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Y_train_data[,2] <- activity_labels[Y_train_data[,1]]

colnames(X_train_data) <- features$V2
train_data_all <- cbind(Y_train_data$V2,X_train_data)
setnames(train_data_all,"Y_train_data$V2","activity")
train_data_all <- cbind(subject_train_data,train_data_all)
setnames(train_data_all,"V1","subjectid")

# Merge the test and train datasets together to create one new dataset

merged_data_all <- rbind(test_data_all,train_data_all)

# get column names
column_names <- colnames(merged_data_all)

# select just the ones we want
the_ones_we_want <- grepl("subjectid|activity|mean|std",column_names)

merged_data <- merged_data_all[,the_ones_we_want]

# https://www.statmethods.net/management/reshape.html
# subjmeans <- cast(mdata, id~variable, mean)

mdata <- melt(merged_data, id=c("subjectid","activity"))
tidy_data <- cast(mdata,subjectid + activity ~ variable, mean)
write.csv(tidy_data,file="./tidy_data.csv")

