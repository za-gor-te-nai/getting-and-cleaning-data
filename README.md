# Getting and Cleaning Data Course Project #

## The raw data ##
The raw data are stored in the file `getdata_projectfiles_UCI HAR Dataset.zip` available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. You should extract the data in the subdirectory `UCI HAR Dataset`. In this subdirectory you will find the full description of the raw data in the file `README.txt` and in the text files mentioned therein.

## The script file ##

The script file `export.R` reads the raw data and produces the two dataset:

1. `x.csv`
2. `xgrouped.csv`

The file `x.csv` provides  the measurements on the mean and standard deviation for each measurement in the raw data after merging the training and the test data sets and relabeling the `activity` factor variable. Originally, this variable was coded with integers ranging from 1 to 6. The variable has been relabeled using the following correspondence: 1=WALKING; 2=WALKING UPSTAIRS; 3=WALKING DOWNSTAIRS; 4=SITTING; 5=STANDING; 6=LAYING.

The data set `x.csv` provides repeated measurements on each individual and each activity which have been summarised by their averages on each individual and each activity. Such a summary is provided by the data set `xgrouped.csv`.

The script file was written and ran in a Linux environment: Kubuntu 18.10 distribution.
