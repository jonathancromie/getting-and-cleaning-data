## Before we start to merge, we're going to add the variable names to each 
## dataset. This will make it easier in the long run when we need to 
## start applying regex and merging by column ids. 
## The information in the README is fairly vague but from what I can gather
## the list of features in features.txt belong as the variable names in 
## each "x" table. The variable name in each subject table will be named
## as subject_id and the variable name in each "y" table relates to activity_id
addVariableNames <- function() {
    colnames(table_x_test) <<- table_features[, 2]
    colnames(table_subject_test) <<- "subject_id"
    colnames(table_y_test) <<- "activity_id"
    
    colnames(table_x_train) <<- table_features[, 2]
    colnames(table_subject_train) <<- "subject_id"
    colnames(table_y_train) <<- "activity_id"
    
    colnames(table_activity_labels) <<- c("activity_id", "description")
}

## Now that the datasets have been loaded into R as data.tables and have had 
## variable names added, we can start binding them together. 
## After looking at the metadata (i.e. nrow(), ncol(), etc.) for 
## the data, it's clear that the "table_subject_test", "table_x_test" and 
## "table_y_test" have the same number of rows and therefore can be column 
## binded. The same goes for the "train" tables. I know it's never safe to 
## assume but this also seems to be the general concensuss on the forums. 
## Once column binded the "table_test" and "table_train" tables should have the 
## same number of columns and can then be merged. 
## cbind() and rbind() could have been used here but I've chosen to go with the
## dplyr functions bind_cols() and bind_rows() for efficiency. 
bindTables <- function() {
    table_test <- bind_cols(table_subject_test, table_x_test, table_y_test)
    table_train <- bind_cols(table_subject_train, table_x_train, table_y_train)
    table_binded <- bind_rows(table_test, table_train)
    return(table_binded)
}

## Extracts the rows with "mean", "std", "subject" and "activity" in their
## respective variable names. You'll notice that angle() is also included in the 
## extracted table. I'm not sure if this is strictly necessary, however it's 
## included anyway just in case.
extractMeanStd <- function() {
    table_extracted <- table_binded %>% 
        select(matches("mean|std|subject|activity"))
    return (table_extracted)
}

## Loops through each description in table_activity_labels and applies an 
## anonymous function which converts the upper case label into a title as well
## as removing the underscore, e.g. WALKING_UPSTAIRS becomes Walking upstairs.
## I don't know if this is completely necessary because they were perfectly
## descriptive to begin with, however I thought I'd create this function just in
## case
renameActivities <- function() {
    table_activity_labels$description <<- 
        lapply(table_activity_labels$description, function(str) {
        str %>% 
            str_to_title() %>% 
            str_replace("_", " ")
    })
}

## Merges extracted table with activity table on activity_id
mergeTables <- function() {
    table_merged <- merge(table_extracted, table_activity_labels, 
                          by = "activity_id", all.x = TRUE)
    
    return (table_merged)
}

## I'm not going to pretend like I know what each variable means (like what's a
## jerk signal) but I'm going to do my best in renaming each so that they are at
## least partially descriptive
renameVariables <- function() {
    column_names <- colnames(table_merged)
    ## remove parenthesis
    column_names <- gsub("\\()", "", column_names)
    ## remove hyphens
    column_names <- gsub("\\-", " ", column_names)
    ## add axes
    column_names <- gsub("(X|Y|Z)", "\\1 Axis", column_names)
    
    ## add time and frequency
    column_names <- gsub("^(t)", "Time", column_names)
    column_names <- gsub("^(f)", "Frequency", column_names)
    
    # rename signals (Acc, Gyro, etc.)
    column_names <- gsub("Acc", "Accelerometer", column_names)
    column_names <- gsub("Gyro", "Gyroscope", column_names)
    column_names <- gsub("Mag", "Magnitude", column_names)
    
    ## remove duplicate words (e.g. BodyBody)
    column_names <- gsub("+(Body)+", "Body", column_names)
    
    ## add space between capitalized words
    column_names <- gsub("([a-z])([A-Z])", "\\1 \\2", column_names)
    
    colnames(table_merged) <<- column_names
}

## Creates a new tidy data set with the average of each variable for each
## subject and each activity
createTidyDataSet <- function() {
    # take the data frame in wide format and melt it into long format
    table_tidy <- melt(table_merged, id.vars = 
                           c("activity_id", "subject_id", "description"))
    
    ## Result of melting. Looks OK.
    # head(table_tidy)
    # activity_id subject_id description                            variable     value
    # 1           1          7     Walking Time Body Accelerometer mean X Axis 0.2693013
    # 2           1         21     Walking Time Body Accelerometer mean X Axis 0.2623422
    # 3           1          7     Walking Time Body Accelerometer mean X Axis 0.2383207
    # 4           1          7     Walking Time Body Accelerometer mean X Axis 0.2447143
    # 5           1         18     Walking Time Body Accelerometer mean X Axis 0.2490386
    # 6           1          7     Walking Time Body Accelerometer mean X Axis 0.2046162
    
    ## cast back to wide format and apply aggregate function "mean"
    table_tidy <- dcast(table_tidy, subject_id + activity_id ~ variable, 
                        fun.aggregate = mean, na.rm = TRUE)
    
    return(table_tidy)
}

## Since I'm a programmer, I'm used to seeing programs having a main method.
## This is what make the program actually run. Since R doesn't have a main
## function which runs automatically, I'm just going to stick the call to this
## function at the bottom of the script.
main <- function() {
    ## Program requires these packages
    require(dplyr)
    require(stringr)
    require(reshape2)
    
    ## Load datasets into R
    print("Loading datasets into R")
    if (!(file.exists("data/activity_labels.txt") &&
          file.exists("data/features.txt") &&
          file.exists("data/test/subject_test.txt") &&
          file.exists("data/test/X_test.txt") &&
          file.exists("data/test/y_test.txt") &&
          file.exists("data/train/subject_train.txt") &&
          file.exists("data/train/X_train.txt") &&
          file.exists("data/train/y_train.txt"))) {
        
        stop("Error: Unable to read data files. Please check if data files exist and have the correct permissions")
    }

    ## Uncomment this when ready to deploy. Since these are already in memory
    ## it's useless having to to read them back in each time the script runs
    
    print("Loading activity_lables.txt")
    table_activity_labels <<- read.table("data/activity_labels.txt")
    print("Loading features.txt")
    table_features <<- read.table("data/features.txt")
    print("Loading subject_test.txt")
    table_subject_test <<- read.table("data/test/subject_test.txt")
    print("Loading X_test.txt")
    table_x_test <<- read.table("data/test/X_test.txt")
    print("Loading y_test.txt")
    table_y_test <<- read.table("data/test/y_test.txt")
    print("Loading subject_train.txt")
    table_subject_train <<- read.table("data/train/subject_train.txt")
    print("Loading X_train.txt")
    table_x_train <<- read.table("data/train/X_train.txt")
    print("Loading y_train.txt")
    table_y_train <<- read.table("data/train/y_train.txt")
    
    print("Adding column names")
    addVariableNames()
    print("Renaming activities")
    renameActivities()
    print("Binding tables")
    table_binded <<- bindTables()
    print("Extracting mean and standard deviation")
    table_extracted <<- extractMeanStd()
    print("Merging tables")
    table_merged <<- mergeTables()
    print("Renaming variables")
    renameVariables()
    print("Creating tidy data set")
    table_tidy <<- createTidyDataSet()

    ## Write table_tidy to txt
    if (file.exists("data/tidy.txt")) {
        stop("A file named 'data/tidy.txt' already exists. Please delete and try again")
    }
    
    print("Writing data to data/tidy.txt")
    write.table(table_tidy, "data/tidy.txt", sep = "\t", row.names = FALSE)
    
    print("Writing complete. Have a nice day!")
}

## Run the program
main()


