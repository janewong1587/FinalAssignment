setwd("./UCI HAR Dataset")

library(dplyr)
library(reshape2)

#1.read "activity_labels.txt" and "features.txt"
activity_labels <- read.table("activity_labels.txt", sep = " ")
names(activity_labels) = c("Activity_ID","Activity_Names")

features <- read.table("features.txt",sep = " ")[,2]


#2.read "y_test.txt" and "y_train.txt" from test and train data seperately.
y_test <- read.table("./test/y_test.txt")
names(y_test) = "Activity_ID"

y_train <- read.table("./train/y_train.txt")
names(y_train) = "Activity_ID"

#3.match test/train labels with activity names
y_test <- inner_join(y_test,activity_labels)
y_train <- inner_join(y_train,activity_labels)

#4.read the training and the test sets
X_test <- read.table("./test/X_test.txt")
names(X_test) = features

X_train <- read.table("./train/X_train.txt")
names(X_train) = features

#5.extract the mean and standard deviation 
X_test <- X_test[,grepl("[Mm]ean|[Ss]td", names(X_test))]
X_train <- X_train[,grepl("[Mm]ean|[Ss]td", names(X_train))]

#6.read the test and train subject information
subject_test <- read.table("./test/subject_test.txt")
names(subject_test) = "Subject_ID"

subject_train <- read.table("./train/subject_train.txt")
names(subject_train) = "Subject_ID"

#7.join test/train sets with correspoinding subject and activity information
test_data <- cbind(subject_test, y_test, X_test)
train_data <- cbind(subject_train, y_train, X_train)

#8.join test and train data together
data <- rbind(test_data, train_data)

#9.cleanup the variable names
clean_names <- names(data) 
clean_names <- gsub("-"," ",clean_names)
clean_names <- gsub("\\(","",clean_names)
clean_names <- gsub("\\)","",clean_names)
clean_names <- gsub(","," ",clean_names)
clean_names <- gsub("BodyBody", "Body", clean_names)

names(data) = clean_names

#10.average the variables for each activity and each subject
id_data <- c("Subject_ID","Activity_ID","Activity_Names")
measures <- setdiff(names(data),id_data)
melt_data <- melt(data,id=id_data,measure.vars = measures)

tidy_data <- dcast(melt_data,Subject_ID + Activity_ID ~ variable,mean)

write.table(tidy_data, file = "tidy_data.txt",row.names = FALSE)
