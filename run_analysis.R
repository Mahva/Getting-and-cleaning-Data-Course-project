<<<<<<< HEAD
##############################################################################
######Getting and Cleaning Data Course Project######
##############################################################################
#
#
#Set Working Directory
setwd("C:/Users/Mah Di/Documents")
#
##############################################################################
# STEP 1 - Get data
##############################################################################
#
# download zip file containing data
#
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
#Unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#
##############################################################################
# STEP 2 - Merging the training and the test sets
##############################################################################
#
# 2-1 - Reading files
#
# Reading trainings tables
#
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
#
# Reading testing tables
#
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
#
# Reading feature vector
#
features <- read.table('./data/UCI HAR Dataset/features.txt')
#
# Reading activity labels
#
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
#
# 2-2 - Assigning column names
#
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
#
#
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
#
#
colnames(activityLabels) <- c('activityId','activityType')
#
# 2-3 - Merging all data in one set
#
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)
#
##############################################################################
# STEP 3 - Mean and standard deviation for each measurement
##############################################################################
#
# 3-1 - Reading column names
#
colNames <- colnames(setAllInOne)
#
# 3-2 - Create vector for defining ID, mean and standard deviation
#
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
#
# Making nessesary subset from setAllInOne
#
setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]
#
##############################################################################
# STEP 4 - Using descriptive activity names to name the activities 
##############################################################################
#
setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)
#
##############################################################################
# STEP 5 - Creating a second, independent tidy data set 
##############################################################################
#
# 5-1 - Making second tidy data set
#
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
#
# 5-2 - Writing second tidy data set in txt file
#
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
#
#############################################################################
#############################################################################
#

















=======
##############################################################################
######Getting and Cleaning Data Course Project######
##############################################################################
#
#
#Set Working Directory
setwd("C:/Users/Mah Di/Documents")
#
##############################################################################
# STEP 1 - Get data
##############################################################################
#
# download zip file containing data
#
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
#Unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#
##############################################################################
# STEP 2 - Merging the training and the test sets
##############################################################################
#
# 2-1 - Reading files
#
# Reading trainings tables
#
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
#
# Reading testing tables
#
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
#
# Reading feature vector
#
features <- read.table('./data/UCI HAR Dataset/features.txt')
#
# Reading activity labels
#
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
#
# 2-2 - Assigning column names
#
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
#
#
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
#
#
colnames(activityLabels) <- c('activityId','activityType')
#
# 2-3 - Merging all data in one set
#
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)
#
##############################################################################
# STEP 3 - Mean and standard deviation for each measurement
##############################################################################
#
# 3-1 - Reading column names
#
colNames <- colnames(setAllInOne)
#
# 3-2 - Create vector for defining ID, mean and standard deviation
#
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
#
# Making nessesary subset from setAllInOne
#
setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]
#
##############################################################################
# STEP 4 - Using descriptive activity names to name the activities 
##############################################################################
#
setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)
#
##############################################################################
# STEP 5 - Creating a second, independent tidy data set 
##############################################################################
#
# 5-1 - Making second tidy data set
#
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
#
# 5-2 - Writing second tidy data set in txt file
#
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
#
#############################################################################
#############################################################################
#

















>>>>>>> 9e092f8eeee8e0c3d908c4ec108adab5a50157ea
