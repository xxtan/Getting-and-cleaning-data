## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## checking and loading require packages  
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

# Read in all the data files 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Get mean and standard deviation
extract_features <- grepl("mean|std", features)

names(xTest) = features
xTest = xTest[,extract_features]

# Prepare activity labels
yTest[,2] = activityLabels[yTest[,1]]
names(yTest) = c("Activity_ID", "Activity_Label")
names(subjectTest) = "subject"

# Bind data
combineTest <- cbind(as.data.table(subjectTest), yTest, xTest)

names(XTrain) = features
XTrain = XTrain[,extract_features]

# Prepare activity data
yTrain[,2] = activityLabels[yTrain[,1]]
names(yTrain) = c("Activity_ID", "Activity_Label")
names(subjectTrain) = "subject"

# Bind data
combineTrain <- cbind(as.data.table(subjectTrain), yTrain, XTrain)

# Combine test and train data
data = rbind(combineTest, combineTrain)

setlabels = c("subject", "Activity_ID", "Activity_Label")
dataLabels = setdiff(colnames(data), setlabels)
meltData = melt(data, id = setlabels, measure.vars = dataLabels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(meltData, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "/users/xiuxiu/desktop/module3/tidy_data.txt", row.name=F)