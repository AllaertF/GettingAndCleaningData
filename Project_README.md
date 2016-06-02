=========
run_analysis.R
=========

The run_analysis.R script was created to summarise the "Human Activity Recognition Using Smartphones Dataset", which was created by the SmartLab laboratory of the University of Genova. The reader is referred to the associated code book (CodeBook.md) for a detailed description of this dataset.


Output
=====

The run_analysis.R script produces a new dataset that contains, for each activity and for each test subject, the average of the measurements on the mean and standard deviation for each measured quantity in the original dataset. This new dataset is named "grouped_averages.txt"


Usage
====

run_analysis.R needs no user input and can be executed by sourcing it into the R console. The only requirement for a correct execution is that the script is placed in the main folder of the original dataset.


Execution steps
==========

run_analysis.R works through a number of intermediate steps. These are explained below:

1) The actual measurements as well as the activity and test subject corresponding to each measurement are read in for the test and the train dataset.

2) The activities and test subjects are added as new columns to the measurement tables. Subsequently, the train and test data are merged into one dataset.

3) From the resulting dataset, a subset containing only the mean and standard deviation of each measured quantity is extracted. The column indices required to do this are first determined by reading in the names of the measured quantities and filtering out only the means and standard deviations.

4) Using the information from the previous step, the columns of the new dataset are given the correct names of the measured variables.

5) The names of the activities are read in. Next, the non-descriptive activity labels in the dataset are replaced by the appropriate activity names.

6) A new dataset is created, containing the average of the measurements of the mean and standard deviation of each measured quantity, for each activity and for each test subject. This final dataset is then written to a file.
