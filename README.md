#Getting-and-Cleaning-Data-Project
This is my project for Coursera's "Getting and Cleaning Data," part of the Data Science specialization. The project consists of the tidy data, the R script, and the Code Book.
The R script, `run_analysis.R`, functions as follows:

  1) It changes the working directory to where the folder containing the data is located. This assumes that you've already downloaded and unziped the data.
  
  2) Loads all the labels and data to R. This includes all the data about from the folders "Train" and "Test."
  
  3) Creates one big data set containing the train and test data.
  
  4) Assigns each numeric entry in "Activity" the corresponding definition in human-readable form.
  
  5) Expands the names of the variables to make them more readable and understandable.
  
  6) Creates a new, tidy dataset containing the id of the subject, and the means for all the activities in which the subject participated.
  
  7) Exports the tidy data set to the working directory.

The Code Book includes the description of important variables.
