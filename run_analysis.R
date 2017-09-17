renameColumns <- function() {
    colnames(table_x_test) <<- table_features[,2]
    colnames(table_x_train) <<- table_features[,2]
}

## Now that the datasets have been loaded into R as data.tables we need to start
## merging them. After looking at the metadata (i.e. nrow(), ncol(), etc.) for 
## the data, it's clear that the "table_subject_test", "table_x_test" and 
## "table_y_test" have the same number of rows and therefore can be column 
## binded. The same goes for the "train" tables. I know it's never safe to 
## assume but this also seems to be the general concensuss on the forums. 
## Once column binded the "table_test" and "table_train" tables should have the 
## same number of columns and can then be merged. 
## cbind() and rbind() could have been used here but I've chosen to go with the
## dplyr functions bind_cols() and bind_rows() for efficiency. 
mergeTables <- function() {
    table_test <- bind_cols(table_subject_test, table_x_test, table_y_test)
    table_train <- bind_cols(table_subject_train, table_x_train, table_y_train)
    table_merged <- bind_rows(table_test, table_train)
    
    
    
    return(table_merged)
}

## Since I'm a programmer, I'm used to seeing programs having a main method.
## This is what make the program actually run. Since R doesn't have a main
## function which runs automatically, I'm just going to stick the call to this
## function at the bottom of the script.
main <- function(args) { 
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

    ## Uncomment this when ready to deploy. Since these are already in memory
    ## it's useless having to to read them back in each time the script runs
    
    # table_activity_labels <- read.table("activity_labels.txt")
    # table_features <- read.table("features.txt")
    # table_subject_test <- read.table("test/subject_test.txt")
    # table_x_test <- read.table("test/X_test.txt")
    # table_y_test <- read.table("test/y_test.txt")
    # table_subject_train <- read.table("train/subject_train.txt")
    # table_x_train <- read.table("train/X_train.txt")
    # table_y_train <- read.table("train/y_train.txt")
    
    ## Add 
    renameColumns()
    table_merged <- mergeTables()
    
    summary(table_merged)
}

## Run the program
main()


