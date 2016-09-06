setwd("/Users/andresparrado/Dropbox/Getting and Cleaning Data/UCI HAR Dataset")

#Mean and Standard deviation, labels
features<- read.table("./features.txt"); features <- as.character(features[,2])
features_mean_sd_indeces <- grep(".*mean.*|.*std.*", features)
features_mean_sd_labels <- features[features_mean_sd_indeces]
features_mean_sd_labels
activity_labels <- read.table("./activity_labels.txt")

#Loading train data into R
x_train <- read.table("./train/X_train.txt")[features_mean_sd_indeces]; colnames(x_train) = features_mean_sd_labels
y_train <-read.table("./train/y_train.txt", col.names = "Activity")
subject_train <- read.table("./train/subject_train.txt", col.names = "Subject")

#Merged train data
train <- cbind(subject_train, y_train, x_train)

#Loading test data into R
x_test <- read.table("./test/X_test.txt")[features_mean_sd_indeces]; colnames(x_test) = features_mean_sd_labels
y_test <-read.table("./test/y_test.txt", col.names = "Activity")
subject_test <- read.table("./test/subject_test.txt", col.names = "Subject")

#Merged test data into R
test <- cbind(subject_test, y_test,x_test)

#All the data and labeling activities
merged_data <- rbind(train,test)
merged_data[["Activity"]] <- activity_labels[match(merged_data[['Activity']],activity_labels[['V1']]), 'V2']

#Substitute Names
names(merged_data) <-gsub("^t", "Time",names(merged_data))
names(merged_data) <-gsub("Acc", "Acceleration",names(merged_data))
names(merged_data) <-gsub("Gyro", "Gyroscope",names(merged_data))
names(merged_data) <-gsub("^f", "Frequency",names(merged_data))
names(merged_data) <-gsub("Mag", "Magnitude",names(merged_data))

#new tidy data set
library(dplyr)
new_data_set <-merged_data %>% group_by(Subject, Activity) %>%
  summarize_each(funs(mean))

#exporting data sets
write.csv(merged_data, "./tidy_data.csv")
write.csv(new_data_set, "./tidy_mean_data.csv")
