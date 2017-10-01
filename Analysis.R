library(plyr)
library(dplyr)
library(data.table)
list.files()
x_test<-read.table("./test/x_test.txt")
y_test<-read.table("./test/y_test.txt")
subject_test<-read.table("./test/subject_test.txt")
x_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")
subject_train<-read.table("./train/subject_train.txt")
features<-read.table("./features.txt")
activity_labels<-read.table("./activity_labels.txt")


#Merging data
 colnames(x_train) <- features[,2] 
 colnames(y_train) <-"activities"
 colnames(subject_train) <- "subjectId"
 
colnames(x_test) <- features[,2] 
 colnames(y_test) <- "activities"
 colnames(subject_test) <- "subjectId"
 
colnames(activity_labels) <- c('activityId','activityType')

 mrg_train <- cbind(y_train, subject_train, x_train)
 mrg_test <- cbind(y_test, subject_test, x_test)
 setAllInOne <- rbind(mrg_train, mrg_test)

#mean and sd
mean<-grep("mean()", names(setAllInOne),value = FALSE, fixed = TRUE)
meanMatrix<-setAllInOne[mean]

sd<-grep("std()", names(setAllInOne),value = FALSE, fixed = TRUE)
sdMatrix<-setAllInOne[sd]

#distcriptive activity name
setAllInOne$activities<-as.character(setAllInOne$activities)
setAllInOne$activities[setAllInOne$activities==1]<- "Walking"
setAllInOne$activities[setAllInOne$activities==2]<- "Walking Upstairs"
setAllInOne$activities[setAllInOne$activities==3]<- "Walking Downstairs"
setAllInOne$activities[setAllInOne$activities==4]<- "Sitting"
setAllInOne$activities[setAllInOne$activities==5]<- "Standing"
setAllInOne$activities[setAllInOne$activities==6]<- "Laying"

#discriptive variable names
names(setAllInOne) <- gsub("Acc", "Accelerator", names(setAllInOne))
names(setAllInOne) <- gsub("Mag", "Magnitude", names(setAllInOne))
names(setAllInOne) <- gsub("Gyro", "Gyroscope", names(setAllInOne))
names(setAllInOne) <- gsub("^t", "time", names(setAllInOne))
names(setAllInOne) <- gsub("^f", "frequency", names(setAllInOne))

#tidy data
DT<-data.table(setAllInOne)
TidyData <- DT[, lapply(.SD, mean), by = 'subjectId,activities']
write.table(TidyData, file = "tidydata.txt", row.names = FALSE)