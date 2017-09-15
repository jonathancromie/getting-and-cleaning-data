## Temporarily set working directory to the data directory in order to read 
## data files
if (!grepl("/data$", getwd())) {
    setwd("data/")
}

## Load datasets into R
if (!(file.exists("activity_labels.txt") &&
    file.exists("features.txt") &&
    file.exists("test/subject_test.txt") &&
    file.exists("test/X_test.txt") &&
    file.exists("test/y_test.txt") &&
    file.exists("train/subject_train.txt") &&
    file.exists("train/X_train.txt") &&
    file.exists("train/y_train.txt"))) {
    
    stop("Error: Unable to read data files. Please check if data files exist and have the correct permissions")
}

table_activity_labels <- read.table("activity_labels.txt")
table_features <- read.table("features.txt")
table_subject_test <- read.table("test/subject_test.txt")
table_x_test <- read.table("test/X_test.txt")
table_y_test <- read.table("test/y_test.txt")
table_subject_train <- read.table("train/subject_train.txt")
table_x_train <- read.table("train/X_train.txt")
table_y_train <- read.table("train/y_train.txt")

