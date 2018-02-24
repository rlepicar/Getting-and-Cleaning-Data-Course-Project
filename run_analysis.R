##
##  Project -- Getting and Cleaning Data Course Project
##

## 1. Merges the training and the test sets to create one data set.

## train dataset
train.X <- read.table("project_data/UCI HAR Dataset/train/X_train.txt")
train.Y <- read.table("project_data/UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("project_data/UCI HAR Dataset/train/subject_train.txt")

## test dataset
test.X <- read.table("project_data/UCI HAR Dataset/test/X_test.txt")
test.Y <- read.table("project_data/UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("project_data/UCI HAR Dataset/test/subject_test.txt")


## merge train/test datasets

merge.X <- rbind(test.X, train.X)
merge.Y <- rbind(test.Y, train.Y)
merge.subject <- rbind(test.subject, train.subject)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("project_data/UCI HAR Dataset/features.txt")
mean.std <- grep("-(mean|std)\\(\\)",features[,2])
mean.std.X <- merge.X[,mean.std]

## 4. Appropriately labels the data set with descriptive variable names.
names(mean.std.X) <- features[mean.std,2]

## 3. Uses descriptive activity names to name the activities in the data set

names(merge.Y) <- "Activity"
names(merge.subject) <- "Subject"

activity <- read.table("project_data/UCI HAR Dataset/activity_labels.txt")
merge.Y[,1] <- activity[merge.Y[,1],2]

tidy.data <- cbind(mean.std.X, merge.Y, merge.subject)


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy.data2 <- aggregate(.~Subject + Activity, tidy.data, mean)

write.table(tidy.data2, file = "tidyset.txt", row.names = FALSE)