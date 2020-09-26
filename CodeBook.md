... to the only wise God

Part I of this code book contains information about the original data as
contained in the existing code book. Part II provides updates to the
existing code book by detailing the transformations done by this
analysis.

PART I
======

Feature Selection
=================

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix 't' to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ
tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag
tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ
fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value std(): Standard deviation mad(): Median absolute
deviation max(): Largest value in array min(): Smallest value in array
sma(): Signal magnitude area energy(): Energy measure. Sum of the
squares divided by the number of values. iqr(): Interquartile range
entropy(): Signal entropy arCoeff(): Autorregresion coefficients with
Burg order equal to 4 correlation(): correlation coefficient between two
signals maxInds(): index of the frequency component with largest
magnitude meanFreq(): Weighted average of the frequency components to
obtain a mean frequency skewness(): skewness of the frequency domain
signal kurtosis(): kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the
FFT of each window. angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window
sample. These are used on the angle() variable:

gravityMean tBodyAccMean tBodyAccJerkMean tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in
'features.txt'

PART II
=======

Essentially, this analysis merges the training and test datasets, having
assigned descriptive names to the columns of the original datasets. This
analysis then selects only columns on mean and standard deviation
measures from the merged dataset. The average values of each selected
feature (79) for each activity and each subject are ultmately computed.

The average values of these 79 features are contained in
the output dataset of this analysis named mean_per_cativity_subject.
The columns (features) in this output data are named by appending "Average_" to
 the corresponding feature name in the original dataset, as shown below. The 
 information about the original variables is available in Part I of this codebook.

1 "activity_id"                              
2 "subject_id"                               
3 "Average_tBodyAcc-mean()-X"                
4 "Average_tBodyAcc-mean()-Y"                
5 "Average_tBodyAcc-mean()-Z"                
6 "Average_tGravityAcc-mean()-X"             
7 "Average_tGravityAcc-mean()-Y"             
8 "Average_tGravityAcc-mean()-Z"             
9 "Average_tBodyAccJerk-mean()-X"            
 10 "Average_tBodyAccJerk-mean()-Y"          
 11 "Average_tBodyAccJerk-mean()-Z"          
 12 "Average_tBodyGyro-mean()-X"             
 13 "Average_tBodyGyro-mean()-Y"             
 14 "Average_tBodyGyro-mean()-Z"             
 15 "Average_tBodyGyroJerk-mean()-X"         
 16 "Average_tBodyGyroJerk-mean()-Y"         
 17 "Average_tBodyGyroJerk-mean()-Z"         
 18 "Average_tBodyAccMag-mean()"             
 19 "Average_tGravityAccMag-mean()"          
 20 "Average_tBodyAccJerkMag-mean()"         
 21 "Average_tBodyGyroMag-mean()"            
 22 "Average_tBodyGyroJerkMag-mean()"        
 23 "Average_fBodyAcc-mean()-X"              
 24 "Average_fBodyAcc-mean()-Y"              
 25 "Average_fBodyAcc-mean()-Z"              
 26 "Average_fBodyAcc-meanFreq()-X"          
 27 "Average_fBodyAcc-meanFreq()-Y"          
 28 "Average_fBodyAcc-meanFreq()-Z"          
 29 "Average_fBodyAccJerk-mean()-X"          
 30 "Average_fBodyAccJerk-mean()-Y"          
 31 "Average_fBodyAccJerk-mean()-Z"          
 32 "Average_fBodyAccJerk-meanFreq()-X"      
 33 "Average_fBodyAccJerk-meanFreq()-Y"      
 34 "Average_fBodyAccJerk-meanFreq()-Z"      
 35 "Average_fBodyGyro-mean()-X"             
 36 "Average_fBodyGyro-mean()-Y"             
 37 "Average_fBodyGyro-mean()-Z"             
 38 "Average_fBodyGyro-meanFreq()-X"         
 39 "Average_fBodyGyro-meanFreq()-Y"         
 40 "Average_fBodyGyro-meanFreq()-Z"         
 41 "Average_fBodyAccMag-mean()"             
 42 "Average_fBodyAccMag-meanFreq()"         
 43 "Average_fBodyBodyAccJerkMag-mean()"     
 44 "Average_fBodyBodyAccJerkMag-meanFreq()" 
 45 "Average_fBodyBodyGyroMag-mean()"        
 46 "Average_fBodyBodyGyroMag-meanFreq()"    
 47 "Average_fBodyBodyGyroJerkMag-mean()"    
 48 "Average_fBodyBodyGyroJerkMag-meanFreq()"
 49 "Average_tBodyAcc-std()-X"               
 50 "Average_tBodyAcc-std()-Y"               
 51 "Average_tBodyAcc-std()-Z"               
 52 "Average_tGravityAcc-std()-X"            
 53 "Average_tGravityAcc-std()-Y"            
 54 "Average_tGravityAcc-std()-Z"            
 55 "Average_tBodyAccJerk-std()-X"           
 56 "Average_tBodyAccJerk-std()-Y"           
 57 "Average_tBodyAccJerk-std()-Z"           
 58 "Average_tBodyGyro-std()-X"              
 59 "Average_tBodyGyro-std()-Y"              
 60 "Average_tBodyGyro-std()-Z"              
 61 "Average_tBodyGyroJerk-std()-X"          
 62 "Average_tBodyGyroJerk-std()-Y"          
 63 "Average_tBodyGyroJerk-std()-Z"          
 64 "Average_tBodyAccMag-std()"              
 65 "Average_tGravityAccMag-std()"           
 66 "Average_tBodyAccJerkMag-std()"          
 67 "Average_tBodyGyroMag-std()"             
 68 "Average_tBodyGyroJerkMag-std()"         
 69 "Average_fBodyAcc-std()-X"               
 70 "Average_fBodyAcc-std()-Y"               
 71 "Average_fBodyAcc-std()-Z"               
 72 "Average_fBodyAccJerk-std()-X"           
 73 "Average_fBodyAccJerk-std()-Y"           
 74 "Average_fBodyAccJerk-std()-Z"           
 75 "Average_fBodyGyro-std()-X"              
 76 "Average_fBodyGyro-std()-Y"              
 77 "Average_fBodyGyro-std()-Z"              
 78 "Average_fBodyAccMag-std()"              
 79 "Average_fBodyBodyAccJerkMag-std()"      
 80 "Average_fBodyBodyGyroMag-std()"         
 81 "Average_fBodyBodyGyroJerkMag-std()"     