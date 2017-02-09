##Data
All datafiles are contained in the folder "UCI HAR Dataset."  This folder should be in the working directory with the analysis script run_analysis.R.  The analysis script should be run from the working directory.

##Script
#Files
The script run_analysis.R reads in the following files:
* y\_test.txt: List of activities corresponding to observations in the test data set, identified by activity ID number.  Stored in test\_y\_df.
* y\_train.txt: List of activities corresponding to observations in the training data set, identified by activity ID number.  Stored in train\_y\_df.
* X\_test.txt: Table of feature values from the test data set, with each column corresponding to one feature and each row to feature values from one observation.  Stored in test\_X\_df.
* X\_train.txt: Table of feature values from the test data set, with each column corresponding to one feature and each row to feature values from one observation.  Stored in train\_X\_df.
* subject\_test.txt:  List of subjects corresponding to the observations in the test set, identified by subject ID number 1-30.  Stored in test\_sub\_df.
* subject\_train.txt:  List of subjects corresponding to the observations in the test set, identified by subject ID number 1-30.  Stored in train\_sub\_df.
* features.txt:  List of feature names corresponding to the collumns in X\_train and X\_test.  Stored as features\_df.
* activity\_labels.txt:  List of activity labels corresponding to the activity ID numbers in y\_test and y\_train.  Stored in actLabels\_df.
#Analysis steps performed by script
* Create new data frames test\_X\_fltrd\_df and train\_X\_fltrd\_df that contain only the mean() and std() columns from X\_test and X\_train.
* Apply activity names to the activities in y\_test and y\_train by matching the activity IDs to labels in actLabels\_df.
* Combine test and train sets into single date frames for each of X, y, and subjects.
* Combine X, y, and subjects into a single data frame.
* Create a tidy data set in a new data frame tidy\_df that averages and groups all features by activity and subject ID.
* Write tidy\_df to a CSV called tidyData.csv.


