

library(dplyr)
#Read in necessary files
test_y_df <- read.table("./UCI HAR Dataset/test/y_test.txt")
train_y_df <- read.table("./UCI HAR Dataset/train/y_train.txt")
test_X_df <- read.table("./UCI HAR Dataset/test/X_test.txt")
train_X_df <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_sub_df <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
train_sub_df <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
features_df <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
actLabels_df <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

#Filter the mean and std variables from all variables in X
lst <- strsplit(features_df$V2, split = "-")
varTypes <- sapply(lst[1:554], function(x) x[[2]])
varTypes[555:561] <- "0"
features_df$varTypes <- varTypes
feat_fltrd_df <- filter(features_df, (varTypes == "mean()") | (varTypes == "std()") )
fltr_vec <- feat_fltrd_df$V1
test_X_fltrd_df <- select(test_X_df, fltr_vec)
train_X_fltrd_df <- select(train_X_df, fltr_vec)

#Give activity names to the activities in y
actLabels_vec <- actLabels_df$V2
test_y_df <- mutate(test_y_df, activity = actLabels_vec[V1])
train_y_df <- mutate(train_y_df, activity = actLabels_vec[V1])

#Combine test and training data sets 
all_y_df <- rbind(test_y_df,train_y_df)
all_X_df <- rbind(test_X_fltrd_df,train_X_fltrd_df)
all_sub_df <- rbind(test_sub_df,train_sub_df)
feature_labels <- feat_fltrd_df$V2
all_X_df <- setNames(all_X_df, feature_labels)
all_sub_df <- setNames(all_sub_df, "subject")

#Combine y, subjects, and X data into a single data frame
combined_df <- select(cbind(all_y_df, all_sub_df, all_X_df), -V1)

#Find the mean by activity and subject and create a new tidy data frame.
tidy_df <- summarise_all(group_by(combined_df, activity, subject), mean)

#Write the tidy_df data frame to a CSV
write.table(tidy_df, file = "./tidyData.csv", sep = ",")