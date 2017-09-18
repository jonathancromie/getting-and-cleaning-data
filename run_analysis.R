## Before we start to merge, we're going to add the variable names to each 
## dataset. This will make it easier in the long run when we need to 
## start applying regex and merging by column ids. 
## The information in the README is fairly vague but from what I can gather
## the list of features in features.txt belong as the variable names in 
## each "x" table. The variable name in each subject table will be named
## as subject_id and the variable name in each "y" table relates to activity_id
addVariableNames <- function() {
    colnames(table_x_test) <<- table_features[,2]
    colnames(table_subject_test) <<- "subject_id"
    colnames(table_y_test) <<- "activity_id"
    
    colnames(table_x_train) <<- table_features[,2]
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
## respective variable names
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

mergeTables <- function() {
    table_merged <- merge(table_extracted, table_activity_labels, 
                          by = "activity_id", all.x = TRUE)
    
    return (table_merged)
}

renameVariables <- function() {
    
}

## Since I'm a programmer, I'm used to seeing programs having a main method.
## This is what make the program actually run. Since R doesn't have a main
## function which runs automatically, I'm just going to stick the call to this
## function at the bottom of the script.
main <- function() { 
    ## Temporarily set working directory to the data directory in order to read 
    ## data files. This assumes you're already in the correct working directory
    ## to begin with, which in this case is 
    ## /Users/jonathancromie/git/getting-and-cleaning-data
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
    
    # table_activity_labels <<- read.table("activity_labels.txt")
    # table_features <<- read.table("features.txt")
    # table_subject_test <<- read.table("test/subject_test.txt")
    # table_x_test <<- read.table("test/X_test.txt")
    # table_y_test <<- read.table("test/y_test.txt")
    # table_subject_train <<- read.table("train/subject_train.txt")
    # table_x_train <<- read.table("train/X_train.txt")
    # table_y_train <<- read.table("train/y_train.txt")
    
    ## Add 
    addVariableNames()
    renameActivities()
    table_binded <<- bindTables()
    table_extracted <<- extractMeanStd()
    table_merged <<- mergeTables()
    renameVariables()
    
    
}

## Run the program
main()


