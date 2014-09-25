run_analysis <- function() {
    
    # Load the mean and std summary data from the test and train data sets
    xTest <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
    xTrain <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
    
    # Combine the mean and std data into a single data.frame
    xTotal <- rbind(xTest, xTrain)
    
    # Start summaryDF with means, stds body accelerations of each dimension from xTotal
    summaryDF <- data.frame("BodyAccXMean"=xTotal[,1], "BodyAccYMean"=xTotal[,2], 
                           "BodyAccZMean"=xTotal[,3], "BodyAccXStd"=xTotal[,4], 
                           "BodyAccYStd"=xTotal[,5], "BodyAccZStd"=xTotal[,6])
    
    # Create a temporary data.frame with means, stds of gyroscopic measurements
    tempDF <- data.frame("BodyGyroXMean"=xTotal[,121], "BodyGyroYMean"=xTotal[,122], 
                         "BodyGyroZMean"=xTotal[,123], "BodyGyroXStd"=xTotal[,124], 
                         "BodyGyroYStd"=xTotal[,125], "BodyGyroZStd"=xTotal[,126])
    # Add the temporary data to the growing summaryDF
    summaryDF <- cbind(summaryDF, tempDF)
    
    # Create a temporary data.frame with means, stds of total acceleration measurements
    tempDF <- data.frame("TotalAccXMean"=xTotal[,41], "TotalAccYMean"=xTotal[,42], 
                         "TotalAccZMean"=xTotal[,43], "TotalAccXStd"=xTotal[,44], 
                         "TotalAccYStd"=xTotal[,45], "TotalAccZStd"=xTotal[,46])
    # Add the temporary data to the growing summaryDF
    summaryDF <- cbind(summaryDF, tempDF)
    
    # Combine the activity code and subject number as columns for test and train data point
    addColsTest <- cbind(yTest, subjectTest)
    addColsTrain <- cbind(yTrain, subjectTrain)
    # Combine the activity codes and subject numbers from test and train data
    addColsTotal <- rbind(addColsTest, addColsTrain)
    
    # Convert the activity codes into activity labels
    activityLabels <- data.frame("UCI_HAR_Dataset/activity_labels.txt")
    for (n in seq_along(addColsTotal[,1]))  {  
        if (addColsTotal[n, 1] == 1)  
            addColsTotal[n,1] = "WALKING"
        else if (addColsTotal[n, 1] == 2)  
            addColsTotal[n,1] = "WALKING_UPSTAIRS"
        else if (addColsTotal[n, 1] == 3)  
            addColsTotal[n,1] = "WALKING_DOWNSTAIRS"
        else if (addColsTotal[n, 1] == 4)  
            addColsTotal[n,1] = "SITTING"
        else if (addColsTotal[n, 1] == 5)  
            addColsTotal[n,1] = "STANDING"
        else if (addColsTotal[n, 1] == 6)  
            addColsTotal[n,1] = "LAYING"
        else 
            addColsTotal[n,1] = NA
    }
    
    # Create a temporary data.frame with activities labels, subjects and meaningful headers
    tempDF <- data.frame("Activity"=addColsTotal[,1], "Subject"=addColsTotal[,2])
    # Add the labeled activities and subjects columns to the summary data.frame
    summaryDF <- cbind(tempDF, summaryDF)
    
    # Order the data by 1) activity, and 2) subject 
    orderedDF <- summaryDF[order(summaryDF[,1], summaryDF[,2]),]
    
    # Return the summary data.frame
    orderedDF
}