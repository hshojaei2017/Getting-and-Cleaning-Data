# Peer-graded Assignment: Getting and Cleaning Data

The R script run_analysis.R performs the following tasks on the Samsung data:

1. Merges the training and test data sets to create one data set. The training and test data sets are first read into R using read.table() command and then merged using the rbind() command. 

2. Extracts only the measurements on the mean and standard deviation for each measurement. Those are the entries that include mean() and std() at the end of their names in features.txt file. 

3. Uses descriptive activity names to name the activities in the data set. This is done using the factor() command. There are 6 different activities: Walking, WalkingUpstairs, WalkingDownstairs, Sitting, Standing, Laying.

4. Appropriately labels the data set with descriptive variable names. Each column of the data is named using the colnames() command. The variable names have been chosen such that they are as descriptive as possilbe. For example the variable name meanofbodyaccelerationintimedomainandxdirection represents the Mean of Body Acceleration in Time Domain and X-direction.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is achieved using the group_by() and summarize() commands from the dplyr package. The resulting data.frame() has 6*30=180 columns. 
