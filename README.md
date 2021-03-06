The purpose of this assignment is to collect, work with, and clean a data set. The final result is therefore a tidy data txt file. To achieve this goal, we have several steps to work on in the script [run_analysis.R](https://github.com/janewong1587/FinalAssignment/blob/master/run_analysis.R).

## Introduction
The Human Activity Recognition Using Smartphones Dataset is from the source http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, where the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Including Files

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'subject_test/train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Algorithm

### Step 1
Read and label the "activity_labels.txt" and "features.txt", e.g. in activity_labels table, Activity_ID =1 ,whereas Activity_Names = WALKING.

### Step 2
Read and label the "y_test.txt" and "y_train.txt" from test and train data seperately.

### Step 3
Match the test/train labels with activity names.

### Step 4
Read the training and the test sets, and the column names are the features.

### Step 5
Extract the mean and standard deviation from the column names.

### Step 6
Read and label the test and train subject information.

### Step 7
Join test/train sets with correspoinding subject and activity information

### Step 8
Join test and train data together

### Step 9
Cleanup the variable names by removing "-", ",", "()", etc.

### Step 10
Average the variables for each activity and each subject, and then write it to a new file.
