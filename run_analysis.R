## Main function to calculate the means of the measurements by activity type and subject 

run_analysis <- function() {
      ## Calls the downloadUnzip helper function to download and unzip the data files in the correct directory
      downloadUnzip()
      
      ## Calls the loadColNames helper function to to create the column names of the dataset
      varNames <- loadColNames() 
      
      ## Calls the dataMerge helper function and creates the complete dataset for analysis
      DataComplete <- dataMerge(varNames) 
      
      ## Reads the Activity names data into a dataframe and sets the CNames variable to the column names of the dataset
      activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt") 
      CNames <- data.frame("ColumnNames"=names(DataComplete))
      
      ## Sets the subset criteria
      require(sqldf)
      subsetCriteria <- sqldf("select * from CNames where (ColumnNames LIKE '%SubjectID%' or ColumnNames LIKE '%Activity%' or ColumnNames LIKE 
                              '%std%' or ColumnNames LIKE '%mean%') and not(ColumnNames LIKE '%gravityMean%' or ColumnNames LIKE '%meanFreq%' or 
                              ColumnNames LIKE '%,gravity%')")
      
      ## Creates a subset of the complete dataset with only the columns we're interested in for analysis.
      subsetData <- DataComplete[,as.character(subsetCriteria$ColumnNames)] 
      
      ## Attaches the database to the R search path so that objects can be accessed by name, 
      ## calculates the mean of each variable by SubjectID and Activity and
      ## detaches the database from the R search path to avoid multiple attach related errors
      attach(subsetData) 
      meanData <- aggregate(subsetData, by=list(SubjectID, Activity), FUN=mean, na.rm=TRUE) 
      detach(subsetData)
      
      ## Renaming the activities with human friendly activity names
      meanData["Activity"] <- activityNames$V2[match(meanData$Activity,activityNames$V1)] 
      
      ## Removing the "Grouped by" columns from the data set
      myVars <- names(meanData[,1:2])
      tidy <<- meanData[, !(names(meanData) %in% myVars)]
      
      ## Calls the tidyColNames helper function to convert the column names into more user friendly, and less error prone names
      tidyColNames()
      
      ## Writes the tidy dataset to a tab delimited text file
      write.table(tidy, "./tidydata.txt", sep="\t", row.names = FALSE)
}

## Helper function to create the directory if it does not exist, download the dataset and unzip it in the right directory
downloadUnzip <- function() {
      ## checks to see whether the data directory exists and creates it if it doesn't
      if(!file.exists("./UCI HAR Dataset")) {
            dir.create("./UCI HAR Dataset")
      }
      
      ## sets the URL for the file download and downloads the file
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, destfile="./data.zip")
      
      ## Unzips the file to the UCI HAR Dataset directory
      unzip("data.zip", exdir=".")
}


## Helper function to read in the data from the files provided and merge them into a complete dataset for analysis
dataMerge <- function(varNames) {
      ## reads the measurement data for both the test and training subjects from the files and merges into a single dataframe
      xTest <- read.table("./UCI HAR Dataset/test/X_test.txt") 
      xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt") 
      xMerge <- rbind2(xTest,xTrain)
      
      ## reads the subject ID data for both the test and training subjects from the files and merges into a single dataframe
      subTest <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
      subTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
      subMerge <- rbind2(subTest,subTrain)
      
      ## reads the activity ID data for both the test and training subjects from the files and merges into a single dataframe
      yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
      yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
      yMerge <- rbind2(yTest,yTrain)
      
      ## Merges the 3 data frames of subject ID, activity ID and measurement data into a single dataframw
      dataComplete <- cbind(subMerge, yMerge, xMerge)
      
      ## Renames the columns with descriptive variable names as passed via varNames from the loadColNames helper function
      colnames(dataComplete) <- varNames 
      
      ## Returns the completed dataframe to the main function for subsetting and analysis
      return(dataComplete)
} 

## Helper function to read in the measurement description names contained in the features file and make them available to other funcions.
loadColNames <- function() {
      ## Reads in the features.txt file into a dataframe
      varNames <- read.table("./UCI HAR Dataset/features.txt") 
      
      ## transposes the varNames dataframe from one column with multiple rows, to one row with multiple columns
      varNames <- t(as.character(varNames[,2]))  
      
      ## adding SubjectID and Activity to the column names for use in subsetting and analysis 
      varNames <- c("SubjectID", "Activity", varNames) 
      
      ## Returns the varNames dataframe to the main function for subsetting and analysis
      return(varNames)
}

## Helper function to clean up the column names of the dataset
tidyColNames <- function() {
      colnames(tidy) <<- gsub("\\(\\)", "", colnames(tidy))
      colnames(tidy) <<- gsub("BodyBody", "Body", colnames(tidy))
      colnames(tidy) <<- gsub("-std", "Std", colnames(tidy))
      colnames(tidy) <<- gsub("-mean", "Mean", colnames(tidy))
      colnames(tidy) <<- gsub("-X", "X", colnames(tidy))
      colnames(tidy) <<- gsub("-Y", "Y", colnames(tidy))
      colnames(tidy) <<- gsub("-Z", "Z", colnames(tidy))
}
