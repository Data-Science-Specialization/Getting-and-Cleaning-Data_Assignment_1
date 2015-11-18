library(dplyr)
library(tidyr)

headDataPath <- file.path(getwd(),'UCI HAR Dataset')
trainDataPath <- file.path(headDataPath, 'train')
testDataPath <- file.path(headDataPath, 'test')

featuresFile <- 'features.txt'
activityLabelFile <- 'activity_labels.txt'

trainXDataFile <- 'X_train.txt'
trainYDataFile <- 'y_train.txt'
trainSubjFile <- 'subject_train.txt'

testXDataFile <- 'X_test.txt'
testYDataFile <- 'y_test.txt'
testSubjFile <- 'subject_test.txt'

# Import feature names
features <- read.table(file.path(headDataPath,featuresFile), 
                           colClasses=c("NULL",'character'), 
                           col.names = c('NULL','features'))

# Function to import data appending X, Y and subject data
importData <- function(dataPath, xDataFile, yDataFile, subjFile, featureNames, designation)
{
    # Import X data
    xData <- read.table(file.path(dataPath, xDataFile),
                             col.names = featureNames)
    xData <- tbl_df(xData)
    
    # Import Y data
    yData <- read.table(file.path(dataPath, yDataFile), 
                        col.names = c('activity'), 
                        colClasses = c('factor'))
    yData <- tbl_df(yData)
    
    # Import subject data
    subjData <- read.table(file.path(dataPath, subjFile),
                                col.names = c('subject'))
    subjData <- tbl_df(subjData)
    
    # Merge X, Y and Subject training data and add column to designation if train or test
    bind_cols(xData, yData, subjData) %>%
        mutate(designation = designation)
}

# *1* Merge the training and the test sets to create one data set
trainData <- importData(trainDataPath, trainXDataFile, trainYDataFile,
                        trainSubjFile, features$features, 'train')
testData <- importData(testDataPath, testXDataFile, testYDataFile,
                        testSubjFile, features$features, 'test')
expData <- bind_rows(trainData, testData)

# *2* Extract only the measurements on the mean and standard deviation
meanStdExpData <- select(expData, contains('mean'), contains('std'), 
                         -contains('angle'), -contains('meanFreq'), activity, subject)

# *3* Use descriptive activity names to name the activities in the data set
# Import activity names
activityNames <- read.table(file.path(headDataPath, activityLabelFile), 
                            col.names = c('NULL','activity'), 
                            colClasses = c('NULL','factor'))
# Substitute numbers with descriptive activity names
levels(meanStdExpData$activity) <- levels(activityNames$activity)

# *4* Appropriately label the data set with descriptive variable names;
# original feature names seem descriptive enough, but need tidying up
names(meanStdExpData) <- gsub('\\.+','_',names(meanStdExpData)) #Remove dots
names(meanStdExpData) <- gsub('_$',"",names(meanStdExpData))    #Remove trailing underscores
names(meanStdExpData) <- gsub('BodyBody','Body',names(meanStdExpData))  #Remove unnecessary 'Body' repetition

# *5* From the data set in step 4, create a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
averageData <- group_by(meanStdExpData, activity, subject) %>%
    summarise_each(funs(mean))

# Export tidy data frame to Tidy Activity.txt
write.table(averageData, file="Tidy Activity.txt", row.names=FALSE)
