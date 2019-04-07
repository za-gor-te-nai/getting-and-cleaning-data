# Codebook  #
In order to get information about the features appearing in the raw data you should refer to the files `README.txt` and `features_info.txt` in the subdirectory `UCI HAR Dataset` you built when decompressing the file `getdata_projectfiles_UCI HAR Dataset.zip`

## xselected.csv ##

68 variables with 10299 observations:

  * 1 id = subject label (categorical)
  * 2 activity = activity label (categorical)
  * 3 - 68 (continuous). In the raw data the following variables appear ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions).
    * tBodyAcc-XYZ
    * tGravityAcc-XYZ
    * tBodyAccJerk-XYZ
    * tBodyGyro-XYZ
    * tBodyGyroJerk-XYZ
    * tBodyAccMag
    * tGravityAccMag
    * tBodyAccJerkMag
    * tBodyGyroMag
    * tBodyGyroJerkMag
    * fBodyAcc-XYZ
    * fBodyAccJerk-XYZ
    * fBodyGyro-XYZ
    * fBodyAccMag
    * fBodyAccJerkMag
    * fBodyGyroMag
    * fBodyGyroJerkMag
	  
  The means and standard deviations of these variables have been estimated over different temporal and spectral windows and they appear with names equal to the ones of the corresponding variables with suffixes `mean()` and `std()` added respectively. These estimated means and standard deviations are sxported in columns 3-68 of this data set.
	  
## xgrouped.csv ##

68 variables with 180 observations:

  * 1 id = subject label (categorical)
  * 2 activity = activity label (categorical)
  * 3-68 averages of the corresponding variables in the file `xselected.csv` (continuous). The names of these variables are equal to the names of the corresponding variables in `xselected.csv` with the prefix `ave` added to each one of them.
