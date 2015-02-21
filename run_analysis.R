library(dplyr)

labels <- read.table('./UCI HAR Dataset/activity_labels.txt')
names(labels) <- c("Act_Num","Activity")
## Reads in the activity labels
      
features <- read.table('./UCI HAR Dataset/features.txt')
names(features) <- c("Feat_Num","Feature")
features[,2] <- gsub("()","",features[,2],fixed=TRUE)
features[,2] <- gsub("-","",features[,2],fixed=TRUE)
##Reads in the features and cleans up the variable names

x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
colnames(x_test) <- features[,2]
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
names(y_test) <- "Act_Num"
sub_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
names(sub_test) <- "Sub_ID"
##Reads in the test data and labels it appropriately

x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
colnames(x_train) <- features[,2]
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
names(y_train) <- "Act_Num"
sub_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
names(sub_train) <- "Sub_ID"
##Reads in the training data and labels it appropriately

test <- cbind(sub_test,x_test,y_test)
train <- cbind(sub_train,x_train,y_train)
all <- rbind(test,train)
all_df <- tbl_df(all)
##Creates a combined tbl_df with all the test and the training data

needed <- subset(all_df,,select=c(Sub_ID,Act_Num,grep("mean|std",colnames(all_df))))
##Creates a subset where the column names refer to mean (including mean frequency) or standard deviation

test1 <- group_by(needed,Sub_ID,Act_Num) 
## Groups the dataset for a good summarisation
test2 <- summarise_each(test1,funs(mean))
## Performs a mean on all columns (except the grouped columns)

fin <- mutate(test2, "Activity"=as.character(labels[Act_Num,2]))
##Creates a separate dataset with a column with the activity name 

fin <- select(fin,Sub_ID,Act_Num,Activity,c(1:(ncol(fin)-1)))
##Arranges the columns in the dataset for easy viewing

write.table(fin,file="./UCI Har Dataset/Tidy_Data.txt",row.names=FALSE)