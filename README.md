... to the only wise God

The script run_analysis.R contain codes that collect and prepare a tidy
data from the Samsung dataset on Human Activity Recognition.

The analysis commenced with the loading of data files downloaded and
domiciled in the working directory. In pursuit of tidy data philosophy,
the columns of each loaded data were given descriptive names as soon as
loaded. Specifically, columns in the 561-feature data frames (X_train
and X_test) were named with names contained in the features data frame
(loaded from feature.txt).

One of the objectives of this analysis is to give descriptive names to
the activities in the dataset. This could achieved by replacing the
integer activity identifiers (1,2,...,6) in data frames y_train/y_test
with descriptive activity names contained in data frame activity\_label.
In doing this, values in these three data frames were first encoded as
factors. Thereafter, the levels of the integer identifiers factors were
set to the levels of the descriptive identifier factor. The script
performs this swapping by using sapply to loop through the factor
levels. Also, the script contains an alternative way of doing this,
using the mapvalues function in the plyr package.

Next, the script pulls together the subject_train (subject of
experiment), X_train (feature vectors) and y_train (output labels) to
obtain a complete training dataset (data_train). Similarly,
subject_test, X_test and y_test are pulled together to obtain
data_test. Thereafter, data_train and data_test are merged together
to obtain a single dataset named data_overall.

As part of the analysis objectives, the script extracts measurements
(columns) on means and standard deviations from data_overall. The
concerned columns were specified using general expression patterns ("mean" and "std") with
the grep function. The extracted data is in a data frame named
mean_and_stddev_measures

Ultimately, the script computes the average of each variable (columns in
mean_and_stddev_measures) for each activity and each subject. In
doing this, the mean_and_stddev_measures data frame was grouped on
the basis of activity (first layer) and subject (second layer), using
the dplyr package. The grouped data frame was subsequently summarized as
means of the variables in each group. The group_by and summarize
functions were implemented in sequence using the pipe operator. The
output of this sequence of operations was stored in a data frame named
mean_per_activity_subject. The columns (features) in this output data are named 
by appending "Average_" to the corresponding feature name in the original dataset.
 The script writes this final output into a
text file named mean_and_stddev_measures.txt.
