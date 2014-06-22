# Analysis of Human Activity Recognition Using Smartphone Dataset
# Version 1.0

Yolande Korsten


## Dataset and origin

This analysis uses the dataset provided by Jorge L. Reyes-Ortiz, Davide Anguita, 
Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The data used represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## This dataset includes the following files:

* ReadMe.md - the document you're reading now
* CodeBook.md - a description of the variables used from the source dataset
* run_analysis.R - the script file that reads the file data into a dataset, 
  performs the data analysis and outputs a tidy dataset of the analysis results

  
## Getting the Data & Analysis Project Setup:


1. Download the dataset from 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the files into your project directory.  You will have a folder called `UCI HAR Dataset` 
   containing all the data files needed to run the analysis.
3. Download the `run_analysis.R` script file from https://github.com/Chaendryn/GettingCleaningDataAssignment
   Save this to your project directory, but ensure that it is one level up from the `UCI HAR Dataset` folder
4. Set your R working directory to your project directory using the `setwd()` command
5. This script requires the *`sqldf`* package. Please ensure that it is installed in your R environment.
   The `sqldf` package has dependencies on the following packages
   * `gsubfin`
   * `proto`
   * `RSQLite`
   * `DBI`
   * `RSQLite.extfuns`


## Script Overview:



1. Main function - `run_analysis()` 
   Main function to calculate the means of the measurements by activity type and subject.  Writes
   the resultant tidy data to a TAB delimited tidy.txt file in the working directory with the 
   `write.table()` command. The data can be read back into R with the `read.table()` command.
2. Helper functions (see comments in the code for more detailed descriptions of each function.)
   * `dataMerge()` 
	 Function to read in the data from the files and merge them into a complete dataset for analysis.
   * `loadColNames()` 
     Function to read in the measurement description names contained in the features file and make 
	 them available to other functions.
   * `tidyColNames()` 
     Function to clean up the column names of the dataset after analysis has been done.


## Assumptions:


The following assumptions have been made regarding the source data, based on visual inspection of the
data files:
* Variables reported in the test and training data sets are in the same order
* There is at least one record for each activity and each subject in the data set
* Because the test and training subjects were randomly assigned to either group, with no preference to 
  which group they assigned, this has not introduced any bias in the measurements or data.
* The source test data and training data have been run through the same filters and therefore requires 
  no additional manipulation prior to analysis to remove bias.  


## Data Processing Done:


The following steps were followed to prepare the complete dataset for analysis.
1. Read into R and merge the x_test and x_train data - measurement data
2. Read into R and merge the y_test and y_train data - activity identifier data
3. Read into R and merge the subject_test and subject_train data - subject identifier for each measurement 
   record
4. Read into R and merge the features.txt file data to add descriptive variable column names to the dataset.
5. Subset the data on all column names containing either 'std' or 'mean' in the variable column name, but
   excluding MeanFreq and GravityMean.
   

 The following steps were done post analysis prior to writing it to a tab delimited text file:
 1. Grouping of the aggregated data by Subject ID and Activity.
 2. Renaming the records with an Activity name based on the activity identifier.
 3. Removing the "Group by" columns from the final dataset.
 4. Manipulation of the column headings information to remove parenthases, dashes, misspellings and spaces 
    that could potentially interfere with analysis of the final dataset. See 'tidyColNames' helper function 
	for details.


## Notes:


1. The final tidy.txt file can be read into R with the `read.table()` function for further exploration and
   analysis
2. Script was last edited and executed on 21 June 2014, 03:10 SAST
3. Script written and executed Windows 7 Professional 64x system with R Studio v. 0.98.501 and R x64 v. 3.1.0
