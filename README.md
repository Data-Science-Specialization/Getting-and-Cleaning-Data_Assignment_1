# Readme for run_analysis.R
*This document describes the workings of the run_analysis.R script which is used to create a tidy dataset from a number of separate tables containing physical activity data.*  

The two primary libraries used for data clean up are *tidyr* and *dplyr* which are loaded at the very start. Subsequently several variables are created which hold the names of the data files and their corresponding directories.

The rest of the script follows these sequential steps:

* Import feature names from *features.txt* into **features** dataframe.
* Import training data into **trainData** dataframe via the following steps, which are broken out into a separate function called ***importData***:  
    1. Import X data and label every column using feature names from **features** dataframe
    2. Import Y data and label the column 'activity'
    3. Import Subject data and label the column 'subject'
    4. Combine X, Y and Subject dataframes into a single dataframe using ***bind_cols***

* Import test data into **testData** dataframe via the same steps outlined above using the ***importData*** function.
* Since training and test dataframes have the same column names they are easily combined into one full dataframe - **expData**, using ***bind_rows*** function.
* Since only the measurements on mean and standard deviation of every feature are required, column names of **expData** are searched and only those with 'mean' and 'std' strings in them are extracted, together with 'activity' and 'subject' columns. **Note:** the 'angle' features do contain 'mean' and 'std' character strings, but they are not measurements on mean and std. Similarly 'meanFreq' features are weighted sums rather then strict 'mean' measurements, thus are omitted as well.
* In order to provide descriptive activity names, the relevant labels are imported into the ***activityNames*** dataframe from *activity_labels.txt* and numeric levels in the *activity* column of the experimental dataframe are replaced with these labels.
* Feature names as per 'features.txt' look descriptive enough, but require some tidying up by replacing dots with underscores and removing unnecessary repetition.
* Finally the dataframe is grouped by activity and subject and mean is found for every feature.
* Lastly clean table is exported into TXT file.

