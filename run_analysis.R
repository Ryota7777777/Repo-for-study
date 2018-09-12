## create data table for test data
testdataX <- read.table("./test/X_test.txt")
testdata <- read.table("./test/subject_test.txt")
testdataY <- read.table("./test/Y_test.txt")
testdata <- transform(testdata, Subject = testdataY)
names(testdata) <- c("Subject", "Activity")
testdata2 <- transform(testdata, Feature = testdataX)

## create data table for train data
traindataX <- read.table("./train/X_train.txt")
traindata <- read.table("./train/subject_train.txt")
traindataY <- read.table("./train/Y_train.txt")
traindata <- transform(traindata, Subject = traindataY)
names(traindata) <- c("Subject", "Activity")
traindata2 <- transform(traindata, Feature = traindataX)

## Merge the training and the test sets to create one data set
mergedata <- rbind(testdata2, traindata2)

## select required colomn - Subject, Activity, mean and standard deviation 
mergedata2 <- mergedata[,c(1:8,43:48,83:88,123:128,163:168,203:205,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,531:532,544:545)]

## add Activity Description
y <- mergedata2$Activity
for(i in 1:10299){if(y[i] == 1){y[i] <- "WALKING"}}
for(i in 1:10299){if(y[i] == 2){y[i] <- "WALKING_UPSTAIRS"}}
for(i in 1:10299){if(y[i] == 3){y[i] <- "WALKING_DOWNSTAIRS"}}
for(i in 1:10299){if(y[i] == 4){y[i] <- "SITTING"}}
for(i in 1:10299){if(y[i] == 5){y[i] <- "STANDING"}}
for(i in 1:10299){if(y[i] == 6){y[i] <- "LAYING"}}
mergedata3 <- cbind(mergedata2[1:2], AcitivityDescription = y, mergedata[3:67])

## add Appropriately labels
features <- read.table("./features.txt")
variableNames <- features$V2
variableLabel <- variableNames[c(1:6,41:46,81:86,121:126,161:166,201:203,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,529:530,542:543)]
variableLabel <- as.character(variableLabel)
label <- c("Subject", "Activity", "AcitivityDescription", variableLabel[1:65])
names(mergedata3) <- label

## creates a second, independent tidy data set with the average of each variable for each activity and each subject
meanSubject <- aggregate(mergedata3, list(mergedata3$Subject), mean)
meanActivity <- aggregate(mergedata3, list(mergedata3$Activity), mean)

## write to CSV files
write.csv(mergedata3, "mergedata.csv")
write.csv(meanSubject, "averageSubject.csv")
write.csv(meanActivity, "averageActivity.csv")
