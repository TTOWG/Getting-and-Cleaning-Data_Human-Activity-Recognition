### ... to the only wise God


# Loading data files and naming columns
activity_labels = read.table("activity_labels.txt")
names(activity_labels) = c("activity_id", "activity_name")

features = read.table("features.txt")
names(features) = c("feature_id", "feature_name")


subject_train = read.table("subject_train.txt")
names(subject_train) = c("subject_id")
subject_test = read.table("subject_test.txt")
names(subject_test) = c("subject_id")

X_train = read.table("X_train.txt")
names(X_train) = features$feature_name
X_test = read.table("X_test.txt")
names(X_test) = features$feature_name


y_train = read.table("y_train.txt")
names(y_train) = c("activity_id")
y_test = read.table("y_test.txt")
names(y_test) = c("activity_id")

# In order to use descriptive activity names contained in activity_label
# to replace integer activity identifiers in y_train/y_test, values in these 
# data frame needed to be encoded as factors.

activity_labels$activity_id = as.factor(activity_labels$activity_id)
activity_labels$activity_name = as.factor(activity_labels$activity_name)
y_train$activity_id = as.factor(y_train$activity_id)
y_test$activity_id = as.factor(y_test$activity_id)

# Tagging activities with descriptive names

# This approach is straight forward, but requires package plyr
#library(plyr)
#levels(y_train$activity_id) = mapvalues(y_train$activity_id, from = activity_labels$activity_id, to = activity_labels$activity_name)
#levels(y_test$activity_id) = mapvalues(y_test$activity_id, from = activity_labels$activity_id, to = activity_labels$activity_name)

# This approach works with base R; reccommended if plyr is not installed
levels(y_train$activity_id) = sapply(levels(y_train$activity_id), function(activity_id){activity_labels[levels(y_train$activity_id)==activity_id,2]})
levels(y_test$activity_id) = sapply(levels(y_test$activity_id), function(activity_id){activity_labels[levels(y_test$activity_id)==activity_id,2]})

# Combining subject_train, X_train and y_train to obtain the full traning data
data_train = cbind(subject_train, X_train, y_train)

# Combining subject_test, X_test and y_test to obtain the full testing data
data_test = cbind(subject_test, X_test, y_test)

# Combining both data_train and data_test to obtain the overall data
data_overall = rbind(data_train, data_test)

# Extracting measurements on mean and standard deviation for each measurement
mean_and_stddev_measures = data_overall[c(1, grep("mean", names(data_overall)), grep("std", names(data_overall)),563)]

library(dplyr)
mean_per_activity_per_person = mean_and_stddev_measures %>% 
  group_by(activity_id, subject_id) %>% 
  summarize(across(`tBodyAcc-mean()-X`:`fBodyBodyGyroJerkMag-std()`, ~ mean(.x, na.rm = TRUE)))
names(mean_per_activity_per_person)[3:81] = sapply(names(mean_per_activity_per_person)[3:81],function(name){paste("Average_",name, sep = "")})

#Writing the output file into a text file
write.table(mean_per_activity_per_person, file = "mean_per_activity_per_person.txt", sep = "\t", row.names = FALSE)
