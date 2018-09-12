The dataset includes the following files:
=========================================

- 'mergedata.csv': Merged the training and the test sets, which extracts only the measurements on the mean and standard deviation

- 'averageSubject.csv': Created from above merged data with the average for each subject

- 'averageActivity.csv': Created from above merged data with the average for each activity

The dataset is transformed as below:
=========================================

- both test data table and train data table are created from the source dataset

- merged the two dataset

- extracts particular data including the mean and standard deviation

- the column for activity description is added

- appropriate labels are added from the source file, features.txt

- second independent data set, includes average of each activity and each subject, are created from above merge data set


Notes: 
======
- run_analysis.R is the script for creating the above three datasets

- This dataset is created from the source data on below URL. For more information about this dataset visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


