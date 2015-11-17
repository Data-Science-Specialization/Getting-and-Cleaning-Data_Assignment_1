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

# Import training X data
trainXData <- read.table(file.path(trainDataPath,trainXDataFile),
                         col.names = features$features)
trainXData <- tbl_df(trainXData)

# Import training X data
trainYData <- read.table(file.path(trainDataPath,trainYDataFile),
                         col.names = c('activityLabel'))
trainYData <- tbl_df(trainYData)



