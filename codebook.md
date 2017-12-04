## Codebook
##
#
This R script will merge data from a test file and a training file.
The results will then be stripted of non mean and std data
A new file called tidy_data.csv will be created that contains the mean by subject id and activity

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The data required is contained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract the datasets which will create a subdirectory of UCI HAR Dataset

### The following files will be created:

* activity_labels.txt - decodes the activities 1-6 into meaningfull names
* features.txt - provides names for the 561 features measured
* features_info.txt which details each feature

The README.TXT files details the testing and measuring methodology

Two subdirectories

* test - contains test measurements
* train - contains train measurements

In R run
run_analysis.R

### The script will do the following.

1. Extracts data from train and test directories, adds meaninfull names to columns
2. Change activity from a code to a meaningfull name
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each me asurement.
5. From the data set created, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Save tidy data set as a csv file for easy analysis

exits

