# First load the data into R - get to the working directory UCI HAR Dataset
# LOad the libraries needed - Datatable and dplyr
library(data.table)
library(dplyr)

# Activity label table
Labels <- data.table(read.table(".\\activity_labels.txt", sep =""))

# Test folder files
activity_test <- data.table(read.table(".\\test\\y_test.txt", sep =""))
subject_test <- data.table(read.table(".\\test\\subject_test.txt", sep =""))
X_test <- data.table(read.table(".\\test\\X_test.txt", sep =""))

# Train folder files
activity_train <- data.table(read.table(".\\train\\y_train.txt", sep =""))
subject_train <- data.table(read.table(".\\train\\subject_train.txt", sep =""))
X_train <- data.table(read.table(".\\train\\X_train.txt", sep =""))

# Bind together both data samples into one table
activity <- rbind(activity_train,activity_test)
subject <- rbind(subject_train,subject_test)
X <- rbind(X_train,X_test)

# Change name of subject table column V1 to a more descriptive name
setnames(subject,"V1", "Subject")

# Read the Test set and calculate the mean and standard deviation per observation. 
X2 <- data.table(meanX = apply(X,1,mean, na.rm = TRUE) , StdX = apply(X,1, sd,na.rm = TRUE))

# Consolidate all the data to match the subject , activity and test set
consolidateData <- cbind(subject,X2,activity)
consolidateData <- arrange(consolidateData,V1)

# Merge with Labels table to get activity name - merge by V1 ID column 
consolidateData <- merge(Labels,consolidateData, by = "V1")

# Delete the ID row for the activity since it is not needed anymore
consolidateData <- consolidateData[, !"V1", with=FALSE] 

# Rename the column of activity name, group by Activity and Subject - summarize the data
# Output is 130 rows (6 activities x 30 subject = 180)
consolidateData %>% rename(ActivityName = V2)  %>% group_by(ActivityName , Subject) %>% summarise(meanX = mean(meanX , na.rm = TRUE) , meanStdX = mean(StdX , na.rm = TRUE))

