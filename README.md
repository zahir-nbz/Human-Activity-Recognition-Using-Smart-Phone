# Human-Activity-Recognition-Using-Smart-Phone

Introduction:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

A full description about the experiment can be found at following link: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

And you can get the dataset here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
download and unzip the dataset, then load it in r.


#This Repository contains a Codebook,tidydata.txt and code script (Analysis.R).

#Codebook
The codebook contains how I combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity which conludes creating a new tidy dataset (tidydata.txt).

#Analysis.R
It is the code script typed in R to create the tidy dataset which does 
the following:
1-Download the dataset if it does not already exist in the working directory
2-Load the activity and feature info
3-Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4-Loads the activity and subject data for each dataset, and merges those columns with the dataset
5-Merges the two datasets
6-Converts the activity and subject columns into factors
7-Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.txt.

