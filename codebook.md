## Codebook

### How to start?
Download the zip file and save it under your working directory /project_data/*
### Overview of the code
This section gives an overview of the different tasks performed by the code *run_analysis.R*:
  - Read train data (X, Y, subject) and test data (X, Y, subject)
  - Merge train and test data
  - Read features and subset mean and standard deviation columns
  - Renames activities in the dataset
  - Make one tidy dataset
### Input files
  - *X_train.txt*: train dataset
  - *Y_train.txt*: activity related to each datapoint in X_train.txt
  - *subject_train.txt*: ID of the volunteer for X_train.txt
  - *X_test.txt*: train dataset
  - *Y_test.txt*: activity related to each datapoint in X_test.txt
  - *subject_test*.txt: ID of the volunteer for X_test.txt
  - *features.txt*: features names
  - *activity_labels.txt*: activity names from Y_train.txt and Y_test.txt
### Source code
  - *run_analysis.R* : code to run using command **source("run_analysis.R")**
### Output files
  - *tidyset.txt* : final tidy dataset
