
# read training and test data sets into R

X_train <- read.table("X_train.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)

X_test <- read.table("X_test.txt", header = FALSE)
y_test <- read.table("y_test.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)


# 1. Merge the training and the test sets to create one data set

X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

# I decided to extract entries that include mean() and std() at the end only
X_summary <- X[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254
                     ,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]

# 3. Use descriptive activity names to name the activities in the data set
activity <- factor(y[,1],labels = c("Walking","WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying"))

# 4. Appropriately label the data set with descriptive variable names

# The variable names have been chosen such that they are as descriptive as possilbe. 
# For example the variable name meanofbodyaccelerationintimedomainandxdirection represents 
# the Mean of Body Acceleration in Time Domain and X-direction.

colnames(X_summary) <- c("meanofbodyaccelerationintimedomainandxdirection", 
                         "meanofbodyaccelerationintimedomainandydirection",
                         "meanofbodyaccelerationintimedomainandzdirection", 
                         "standarddeviationofbodyaccelerationintimedomainandxdirection",
                         "standarddeviationofbodyaccelerationintimedomainandydirection",
                         "standarddeviationofbodyaccelerationintimedomainandzdirection",
                         "meanofgravityaccelerationintimedomainandxdirection", 
                         "meanofgravityaccelerationintimedomainandydirection",
                         "meanofgravityaccelerationintimedomainandzdirection", 
                         "standarddeviationofgravityaccelerationintimedomainandxdirection",
                         "standarddeviationofgravityaccelerationintimedomainandydirection",
                         "standarddeviationofgravityaccelerationintimedomainandzdirection",
                         "meanofjerkofbodyaccelerationintimedomainandxdirection", 
                         "meanofjerkofbodyaccelerationintimedomainandydirection",
                         "meanofjerkofbodyaccelerationintimedomainandzdirection", 
                         "standarddeviationofjerkofbodyaccelerationintimedomainandxdirection",
                         "standarddeviationofjerkofbodyaccelerationintimedomainandydirection",
                         "standarddeviationofjerkofbodyaccelerationintimedomainandzdirection",
                         "meanofbodyangularvelocityintimedomainandxdirection", 
                         "meanofbodyangularvelocityintimedomainandydirection",
                         "meanofbodyangularvelocityintimedomainandzdirection", 
                         "standarddeviationofbodyangularvelocityintimedomainandxdirection",
                         "standarddeviationofbodyangularvelocityintimedomainandydirection",
                         "standarddeviationofbodyangularvelocityintimedomainandzdirection",
                         "meanofjerkofbodyangularvelocityintimedomainandxdirection", 
                         "meanofjerkofbodyangularvelocityintimedomainandydirection",
                         "meanofjerkofbodyangularvelocityintimedomainandzdirection", 
                         "standarddeviationofjerkofbodyangularvelocityintimedomainandxdirection",
                         "standarddeviationofjerkofbodyangularvelocityintimedomainandydirection",
                         "standarddeviationofjerkofbodyangularvelocityintimedomainandzdirection",
                         "meanofmagnitudeofbodyaccelerationintimedomain", 
                         "standarddeviationofmagnitudeofbodyaccelerationintimedomain", 
                         "meanofmagnitudeofgravityaccelerationintimedomain", 
                         "standarddeviationofmagnitudeofgravityaccelerationintimedomain", 
                         "meanofmagnitudeofjerkofbodyaccelerationintimedomain", 
                         "standarddeviationofmagnitudeofjerkofbodyaccelerationintimedomain", 
                         "meanofmagnitudeofbodyangularvelocityintimedomain", 
                         "standarddeviationofmagnitudeofbodyangularvelocityintimedomain", 
                         "meanofmagnitudeofjerkofbodyangularvelocityintimedomain", 
                         "standarddeviationofmagnitudeofjerkofbodyangularvelocityintimedomain", 
                         "meanofbodyaccelerationinfrequencydomainandxdirection", 
                         "meanofbodyaccelerationinfrequencydomainandydirection",
                         "meanofbodyaccelerationinfrequencydomainandzdirection", 
                         "standarddeviationofbodyaccelerationinfrequencydomainandxdirection",
                         "standarddeviationofbodyaccelerationinfrequencydomainandydirection",
                         "standarddeviationofbodyaccelerationinfrequencydomainandzdirection",
                         "meanofjerkofbodyaccelerationinfrequencydomainandxdirection", 
                         "meanofjerkofbodyaccelerationinfrequencydomainandydirection",
                         "meanofjerkofbodyaccelerationinfrequencydomainandzdirection", 
                         "standarddeviationofjerkofbodyaccelerationinfrequencydomainandxdirection",
                         "standarddeviationofjerkofbodyaccelerationinfrequencydomainandydirection",
                         "standarddeviationofjerkofbodyaccelerationinfrequencydomainandzdirection",
                         "meanofbodyangularvelocityinfrequencydomainandxdirection", 
                         "meanofbodyangularvelocityinfrequencydomainandydirection",
                         "meanofbodyangularvelocityinfrequencydomainandzdirection", 
                         "standarddeviationofbodyangularvelocityinfrequencydomainandxdirection",
                         "standarddeviationofbodyangularvelocityinfrequencydomainandydirection",
                         "standarddeviationofbodyangularvelocityinfrequencydomainandzdirection",
                         "meanofmagnitudeofbodyaccelerationinfrequencydomain", 
                         "standarddeviationofmagnitudeofbodyaccelerationinfrequencydomain", 
                         "meanofmagnitudeofjerkofbodyaccelerationinfrequencydomain", 
                         "standarddeviationofmagnitudeofjerkofbodyaccelerationinfrequencydomain", 
                         "meanofmagnitudeofbodyangularvelocityinfrequencydomain", 
                         "standarddeviationofmagnitudeofbodyangularvelocityinfrequencydomain", 
                         "meanofmagnitudeofjerkofbodyangularvelocityinfrequencydomain", 
                         "standarddeviationofmagnitudeofjerkofbodyangularvelocityinfrequencydomain")

# merging the data
names(subject) <- "subject"
data_summary <- cbind(activity, subject, X_summary)

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
# The resulting data.frame() has 6*30=180 columns.

library(dplyr)

# group data set by activity and subject
grouped <- group_by (data_summary, activity, subject)

tidy_dataset <- summarize (grouped, meanofbodyaccelerationintimedomainandxdirection = mean(meanofbodyaccelerationintimedomainandxdirection),
                          meanofbodyaccelerationintimedomainandydirection = mean(meanofbodyaccelerationintimedomainandydirection),
                          meanofbodyaccelerationintimedomainandzdirection = mean(meanofbodyaccelerationintimedomainandzdirection), 
                          standarddeviationofbodyaccelerationintimedomainandxdirection = mean(standarddeviationofbodyaccelerationintimedomainandxdirection),
                          standarddeviationofbodyaccelerationintimedomainandydirection = mean(standarddeviationofbodyaccelerationintimedomainandydirection),
                          standarddeviationofbodyaccelerationintimedomainandzdirection = mean(standarddeviationofbodyaccelerationintimedomainandzdirection),
                          meanofgravityaccelerationintimedomainandxdirection = mean(meanofgravityaccelerationintimedomainandxdirection), 
                          meanofgravityaccelerationintimedomainandydirection = mean(meanofgravityaccelerationintimedomainandydirection),
                          meanofgravityaccelerationintimedomainandzdirection = mean(meanofgravityaccelerationintimedomainandzdirection), 
                          standarddeviationofgravityaccelerationintimedomainandxdirection = mean(standarddeviationofgravityaccelerationintimedomainandxdirection),
                          standarddeviationofgravityaccelerationintimedomainandydirection = mean(standarddeviationofgravityaccelerationintimedomainandydirection),
                          standarddeviationofgravityaccelerationintimedomainandzdirection = mean(standarddeviationofgravityaccelerationintimedomainandzdirection),
                          meanofjerkofbodyaccelerationintimedomainandxdirection = mean(meanofjerkofbodyaccelerationintimedomainandxdirection), 
                          meanofjerkofbodyaccelerationintimedomainandydirection = mean(meanofjerkofbodyaccelerationintimedomainandydirection),
                          meanofjerkofbodyaccelerationintimedomainandzdirection = mean(meanofjerkofbodyaccelerationintimedomainandzdirection), 
                          standarddeviationofjerkofbodyaccelerationintimedomainandxdirection = mean(standarddeviationofjerkofbodyaccelerationintimedomainandxdirection),
                          standarddeviationofjerkofbodyaccelerationintimedomainandydirection = mean(standarddeviationofjerkofbodyaccelerationintimedomainandydirection),
                          standarddeviationofjerkofbodyaccelerationintimedomainandzdirection = mean(standarddeviationofjerkofbodyaccelerationintimedomainandzdirection),
                          meanofbodyangularvelocityintimedomainandxdirection = mean(meanofbodyangularvelocityintimedomainandxdirection), 
                          meanofbodyangularvelocityintimedomainandydirection = mean(meanofbodyangularvelocityintimedomainandydirection),
                          meanofbodyangularvelocityintimedomainandzdirection = mean(meanofbodyangularvelocityintimedomainandzdirection), 
                          standarddeviationofbodyangularvelocityintimedomainandxdirection = mean(standarddeviationofbodyangularvelocityintimedomainandxdirection),
                          standarddeviationofbodyangularvelocityintimedomainandydirection = mean(standarddeviationofbodyangularvelocityintimedomainandydirection),
                          standarddeviationofbodyangularvelocityintimedomainandzdirection = mean(standarddeviationofbodyangularvelocityintimedomainandzdirection), 
                          meanofjerkofbodyangularvelocityintimedomainandxdirection = mean(meanofjerkofbodyangularvelocityintimedomainandxdirection), 
                          meanofjerkofbodyangularvelocityintimedomainandydirection = mean(meanofjerkofbodyangularvelocityintimedomainandydirection),
                          meanofjerkofbodyangularvelocityintimedomainandzdirection = mean(meanofjerkofbodyangularvelocityintimedomainandzdirection), 
                          standarddeviationofjerkofbodyangularvelocityintimedomainandxdirection = mean(standarddeviationofjerkofbodyangularvelocityintimedomainandxdirection),
                          standarddeviationofjerkofbodyangularvelocityintimedomainandydirection = mean(standarddeviationofjerkofbodyangularvelocityintimedomainandydirection),
                          standarddeviationofjerkofbodyangularvelocityintimedomainandzdirection = mean(standarddeviationofjerkofbodyangularvelocityintimedomainandzdirection),
                          meanofmagnitudeofbodyaccelerationintimedomain = mean(meanofmagnitudeofbodyaccelerationintimedomain), 
                          standarddeviationofmagnitudeofbodyaccelerationintimedomain = mean(standarddeviationofmagnitudeofbodyaccelerationintimedomain), 
                          meanofmagnitudeofgravityaccelerationintimedomain = mean(meanofmagnitudeofgravityaccelerationintimedomain), 
                          standarddeviationofmagnitudeofgravityaccelerationintimedomain = mean(standarddeviationofmagnitudeofgravityaccelerationintimedomain), 
                          meanofmagnitudeofjerkofbodyaccelerationintimedomain = mean(meanofmagnitudeofjerkofbodyaccelerationintimedomain), 
                          standarddeviationofmagnitudeofjerkofbodyaccelerationintimedomain = mean(standarddeviationofmagnitudeofjerkofbodyaccelerationintimedomain), 
                          meanofmagnitudeofbodyangularvelocityintimedomain = mean(meanofmagnitudeofbodyangularvelocityintimedomain), 
                          standarddeviationofmagnitudeofbodyangularvelocityintimedomain = mean(standarddeviationofmagnitudeofbodyangularvelocityintimedomain), 
                          meanofmagnitudeofjerkofbodyangularvelocityintimedomain = mean(meanofmagnitudeofjerkofbodyangularvelocityintimedomain), 
                          standarddeviationofmagnitudeofjerkofbodyangularvelocityintimedomain = mean(standarddeviationofmagnitudeofjerkofbodyangularvelocityintimedomain), 
                          meanofbodyaccelerationinfrequencydomainandxdirection = mean(meanofbodyaccelerationinfrequencydomainandxdirection), 
                          meanofbodyaccelerationinfrequencydomainandydirection = mean(meanofbodyaccelerationinfrequencydomainandydirection),
                          meanofbodyaccelerationinfrequencydomainandzdirection = mean(meanofbodyaccelerationinfrequencydomainandzdirection), 
                          standarddeviationofbodyaccelerationinfrequencydomainandxdirection = mean(standarddeviationofbodyaccelerationinfrequencydomainandxdirection),
                          standarddeviationofbodyaccelerationinfrequencydomainandydirection = mean(standarddeviationofbodyaccelerationinfrequencydomainandydirection),
                          standarddeviationofbodyaccelerationinfrequencydomainandzdirection = mean(standarddeviationofbodyaccelerationinfrequencydomainandzdirection),
                          meanofjerkofbodyaccelerationinfrequencydomainandxdirection = mean(meanofjerkofbodyaccelerationinfrequencydomainandxdirection), 
                          meanofjerkofbodyaccelerationinfrequencydomainandydirection = mean(meanofjerkofbodyaccelerationinfrequencydomainandydirection),
                          meanofjerkofbodyaccelerationinfrequencydomainandzdirection = mean(meanofjerkofbodyaccelerationinfrequencydomainandzdirection), 
                          standarddeviationofjerkofbodyaccelerationinfrequencydomainandxdirection = mean(standarddeviationofjerkofbodyaccelerationinfrequencydomainandxdirection),
                          standarddeviationofjerkofbodyaccelerationinfrequencydomainandydirection = mean(standarddeviationofjerkofbodyaccelerationinfrequencydomainandydirection),
                          standarddeviationofjerkofbodyaccelerationinfrequencydomainandzdirection = mean(standarddeviationofjerkofbodyaccelerationinfrequencydomainandzdirection),
                          meanofbodyangularvelocityinfrequencydomainandxdirection = mean(meanofbodyangularvelocityinfrequencydomainandxdirection), 
                          meanofbodyangularvelocityinfrequencydomainandydirection = mean(meanofbodyangularvelocityinfrequencydomainandydirection),
                          meanofbodyangularvelocityinfrequencydomainandzdirection = mean(meanofbodyangularvelocityinfrequencydomainandzdirection), 
                          standarddeviationofbodyangularvelocityinfrequencydomainandxdirection = mean(standarddeviationofbodyangularvelocityinfrequencydomainandxdirection),
                          standarddeviationofbodyangularvelocityinfrequencydomainandydirection = mean(standarddeviationofbodyangularvelocityinfrequencydomainandydirection),
                          standarddeviationofbodyangularvelocityinfrequencydomainandzdirection = mean(standarddeviationofbodyangularvelocityinfrequencydomainandzdirection),
                          meanofmagnitudeofbodyaccelerationinfrequencydomain = mean(meanofmagnitudeofbodyaccelerationinfrequencydomain), 
                          standarddeviationofmagnitudeofbodyaccelerationinfrequencydomain = mean(standarddeviationofmagnitudeofbodyaccelerationinfrequencydomain), 
                          meanofmagnitudeofjerkofbodyaccelerationinfrequencydomain = mean(meanofmagnitudeofjerkofbodyaccelerationinfrequencydomain), 
                          standarddeviationofmagnitudeofjerkofbodyaccelerationinfrequencydomain = mean(standarddeviationofmagnitudeofjerkofbodyaccelerationinfrequencydomain), 
                          meanofmagnitudeofbodyangularvelocityinfrequencydomain = mean(meanofmagnitudeofbodyangularvelocityinfrequencydomain), 
                          standarddeviationofmagnitudeofbodyangularvelocityinfrequencydomain = mean(standarddeviationofmagnitudeofbodyangularvelocityinfrequencydomain), 
                          meanofmagnitudeofjerkofbodyangularvelocityinfrequencydomain = mean(meanofmagnitudeofjerkofbodyangularvelocityinfrequencydomain), 
                          standarddeviationofmagnitudeofjerkofbodyangularvelocityinfrequencydomain = mean(standarddeviationofmagnitudeofjerkofbodyangularvelocityinfrequencydomain))

# save the new data set as tidy_data.txt 
write.table(tidy_dataset, file = "tidy_data.txt", row.names = FALSE)





