This readme file pertains to the Course Project for the Data Cleaning Course. As part of this assignment, we have attempted to tidy some data from the UCI HAR Dataset and prepare a tidy dataset.

The readme file from the original UCI HAR Dataset has been included in this repo and named README_Old.txt, to allow users to refer to it for any pertinent information pertaining to the experiment and/or the data collected through it. 

The repo also contains a file FeatureNaming.txt, which provdes additional information regarding the features, specifically how they are to be interpreted from their names.

The run_analysis.R script included in this repo takes the data from the UCI HAR Dataset and tidies it, to reveal a dataset that includes the mean of all variables which referred to mean or standard deviation in the original dataset. Furthermore, these are grouped by Subject and Activity, so that we can determine the mean of each variable for each Subject and each Activity performed by the Subject.

"Tidy_Data.txt" is the cleaned up version of the UCI HAR data, which is an output of the "run_analysis.R" script.

CodeBook.md briefly describes the experiment and the data and describes the data cleaning process. It also provides description for each variable from the tidy dataset. A formatted easy-to-read pdf version of the CodeBook is also included in the repo.

At this point, it is relevant to mention that there are several errors in the naming of the features in the original dataset. While I have not cleaned these variables within this script, I have had to "work around" during the data analysis. For example, the variables pertaining to bandsEnergy had no axis symbols assigned to them, which led to duplication (actually triplication) of columns. Additionally, there is a whole bunch of variables pertaining to body acceleration details which are mislabelled as BodyBody - thankfully, this was only a typo and did not hinder with the analysis in any way. There are also 2 variables used in the angle() function which have not been described anywhere in the original data (gravity and gravityMean) - again, since the angle variables were not utilised for the analysis at all, there was no impact. My pipe dream is to correct these errors eventually... but this code does not perform this correction.
