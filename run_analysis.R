# Cleans and combines training and test data from the UCI HAR dataset

# load meta data for the feature names
nameTable <- read.table(file = 'UCI HAR Dataset/features.txt', sep=' ', col.names = c('index', 'feature'))
# create a boolean vector to extract relevant columns
desiredColumns <- grepl("mean", nameTable$feature) | grepl('std', nameTable$feature)

# reads the table, labels, and filters out the desired columns
load_file <- function(file) {
  data <- read.table(file = file)
  # add labels from the features.txt meta data
  names(data)<-nameTable$feature
  # filter to extract the desired columns 
  data[,desiredColumns]
}

# get the activity value translation table
activityTable <- read.table(file='UCI HAR Dataset/activity_labels.txt', col.names = c('index', 'activity'))

# define a function to append translated versions of the activity column, which is taken from a separate file
add_activity <- function(file, data) {
  # add the activity columns from the Y files
  Y<-read.table(file = file, col.names = c('index'))
  activity<-merge(Y,activityTable, by="index")$activity
  
  # translate the activity columns and append the result to the train data set
  cbind(data,activity)
}

# adds the test subject column, which is stored in a separate file.
add_subject <- function(file, data) {
  subject<-read.table(file = file, col.names = c('subject'))
  subject<-as.factor(subject$subject)
  cbind(data,subject)
}

# Load and basic clean
train<-load_file(file = 'UCI HAR Dataset/train/X_train.txt')
test<-load_file(file = 'UCI HAR Dataset/test/X_test.txt')

# Add in the activity column
train<-add_activity(file='UCI HAR Dataset/train/y_train.txt', data=train)
test<-add_activity(file='UCI HAR Dataset/test/y_test.txt', data=test)

train<-add_subject(file='UCI HAR Dataset/train/subject_train.txt', data=train)
test<-add_subject(file='UCI HAR Dataset/test/subject_test.txt', data=test)

# rbind the two sets together
all<-rbind(train,test)

# clean up individual sets to save memory
rm(test, train, nameTable, desiredColumns, activityTable)

# reshape the data set to give averages for each variable grouped by subject and activity.
library(reshape2)
mltAll<-melt(all, id= c('subject', 'activity'))
output<-dcast(mltAll, subject + activity ~ variable, mean)

# output results 
write.table(output, file = 'output.txt', row.names = FALSE)