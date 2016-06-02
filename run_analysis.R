# Read in the test and train data sets
test <- read.table("test/X_test.txt")
test_subj <- read.table("test/subject_test.txt")
test_activ <- read.table("test/Y_test.txt")
train <- read.table("train/X_train.txt")
train_subj <- read.table("train/subject_train.txt")
train_activ <- read.table("train/y_train.txt")

# Merge both datasets
test_comp <- cbind(activity=test_activ$V1, subject=test_subj$V1, test)
train_comp <- cbind(activity=train_activ$V1, subject=train_subj$V1, train)
complete <- rbind(train_comp, test_comp)

# Read in the column names of the test and train data sets
features <- read.table("features.txt", stringsAsFactors = FALSE)

# Extract only the mean and std for each measurement
mnstd_indx <- grep("mean\\(\\)|std\\(\\)", features$V2)
mnstd <- complete[,c(1,2,2+mnstd_indx)]

# Give the columns appropriate names
mnstd_labels <- features$V2[mnstd_indx]
mnstd_labels <- gsub("\\(\\)", "", mnstd_labels)
names(mnstd) <- c("activity", "subject", mnstd_labels)

# Use descriptive activity names
activity_labels <- read.table("activity_labels.txt")
mnstd$activity <- factor(mnstd$activity, labels=activity_labels$V2)

# Derive the average of each measurement for each activity and each subject
averages <- aggregate(mnstd[,c(-1,-2)], list(activity=mnstd$activity, subject=mnstd$subject), mean)
write.table(averages, "grouped_averages.txt", row.names=FALSE)
