rm(list=ls())
graphics.off()

require(readr)
require(dplyr)


## load variable names
con <- file('UCI HAR Dataset/features.txt', open='r')
varNames <- readLines(con)
close(con)

## read the training data set (561 features?)
xTrain <- read_table('UCI HAR Dataset/train/X_train.txt', col_names=F)


## read the activity description (training data)
yTrain <- scan('UCI HAR Dataset/train/y_train.txt')

## read subject identification (training data)
idTrain <- scan('UCI HAR Dataset/train/subject_train.txt')

## Include the subject and activity identification variables in the training dataframe as factors
xTrain <- data.frame(as.factor(idTrain),as.factor(yTrain),xTrain)
varNames <- c('id','activity',varNames)
names(xTrain) <- varNames

## read the test data set (561 features)
xTest <- read_table('UCI HAR Dataset/test/X_test.txt', col_names=F)


## read the activity description (test data)
yTest <- scan('UCI HAR Dataset/test/y_test.txt')

## read subject identification (test data)
idTest <- scan('UCI HAR Dataset/test/subject_test.txt')

## Include the subject and activity identification variables in the test dataframe as factors
xTest <- data.frame(id=as.factor(idTest),activity=as.factor(yTest),xTest)
names(xTest) <- varNames

## Merge the training and test dataframes
x <- merge(xTrain,xTest, all=TRUE)

## Build a new dataframe by selecting the mean and std variables
selVars <- grep('id|activity|mean\\(\\)|std\\(\\)',names(x))
lsv <- length(selVars)
xSelected <- select(x, selVars)
xSelected <- arrange(xSelected, id, activity)

## rename activities
levels(xSelected$activity) <- c('WALKING',
                         'WALKING_UPSTAIRS',
                         'WALKING_DOWNSTAIRS',
                         'SITTING',
                         'STANDING',
                         'LAYING')
names(xSelected) <- sub('(^[0-9]{1,3} )','',names(xSelected))

## Build a dataframe providing the average of the selected variables for each subject and each activity
xSelectedGrouped <- xSelected %>%
    group_by(id,activity) %>%
    summarise_all(funs(mean))

names(xSelectedGrouped)[3:ncol(xSelected)] <- paste('ave',names(xSelected)[3:ncol(xSelected)], sep='')

write_csv(xSelected, 'xselected.csv')
write_csv(xSelectedGrouped, 'xgrouped.csv')
