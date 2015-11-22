# Features contained in the Tidy Activity.txt dataset

This dataset contains averages corresponding to each activity-subject pair of every feature vector containing mean and standard deviation. The "activity" column contains descriptive activity labels, while the "subject" column contain the subject ID.
In all features the units for acceleration signals are standard gravity units 'g', while those of gyroscope measurements are radians/second.

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc_XYZ and tGyro_XYZ, where '_XYZ' is used to denote 3-axial signals in the X, Y and Z directions. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc_XYZ and tGravityAcc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Finally mean and standard deviation were calculated from these signals resulting in the following features:

"tBodyAcc_mean_X"      
"tBodyAcc_mean_Y"      
"tBodyAcc_mean_Z"  
"tBodyGyro_mean_X"     
"tBodyGyro_mean_Y"     
"tBodyGyro_mean_Z"  
"tGravityAcc_mean_X"   
"tGravityAcc_mean_Y"   
"tGravityAcc_mean_Z"

"tBodyAcc_std_X"       
"tBodyAcc_std_Y"       
"tBodyAcc_std_Z"  
"tBodyGyro_std_X"      
"tBodyGyro_std_Y"      
"tBodyGyro_std_Z"  
"tGravityAcc_std_X"    
"tGravityAcc_std_Y"    
"tGravityAcc_std_Z"    

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk_XYZ and tBodyGyroJerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag) and once again mean and standard deviation measures were calculated for these signals, resulting in:

"tBodyAccJerk_mean_X"  
"tBodyAccJerk_mean_Y"  
"tBodyAccJerk_mean_Z"  
"tBodyGyroJerk_mean_X"  
"tBodyGyroJerk_mean_Y"  
"tBodyGyroJerk_mean_Z"  
"tBodyAccMag_mean"     
"tGravityAccMag_mean"  
"tBodyAccJerkMag_mean"  
"tBodyGyroMag_mean"    
"tBodyGyroJerkMag_mean"  

"tBodyAccJerk_std_X"   
"tBodyAccJerk_std_Y"   
"tBodyAccJerk_std_Z"   
"tBodyGyroJerk_std_X"  
"tBodyGyroJerk_std_Y"  
"tBodyGyroJerk_std_Z"  
"tBodyAccMag_std"      
"tGravityAccMag_std"   
"tBodyAccJerkMag_std"  
"tBodyGyroMag_std"     
"tBodyGyroJerkMag_std" 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc_XYZ, fBodyAccJerk_XYZ, fBodyGyro_XYZ, fBodyAccJerkMag, fBodyAccMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). Similarly to the above mean and standard deviation were calculated for each signal:

"fBodyAcc_mean_X"      
"fBodyAcc_mean_Y"      
"fBodyAcc_mean_Z"      
"fBodyAccJerk_mean_X"  
"fBodyAccJerk_mean_Y"  
"fBodyAccJerk_mean_Z"  
"fBodyGyro_mean_X"     
"fBodyGyro_mean_Y"     
"fBodyGyro_mean_Z"     
"fBodyAccJerkMag_mean"  
"fBodyAccMag_mean"  
"fBodyGyroMag_mean"     
"fBodyGyroJerkMag_mean"  

"fBodyAcc_std_X"       
"fBodyAcc_std_Y"       
"fBodyAcc_std_Z"       
"fBodyAccJerk_std_X"   
"fBodyAccJerk_std_Y"   
"fBodyAccJerk_std_Z"   
"fBodyGyro_std_X"      
"fBodyGyro_std_Y"      
"fBodyGyro_std_Z"      
"fBodyAccJerkMag_std"  
"fBodyAccMag_std"  
"fBodyGyroMag_std"      
"fBodyGyroJerkMag_std"
