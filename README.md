 

Below you will find information on the files used and the steps that were carried out to carry out the Script.



DATA SOURCE
 
'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'train / subject_train.txt': Test who performed train

'test / subject_test.txt' : Test subject who performed test
 

 
STEPS TO GENERATE THE SCRIPT

- Load information on inputs.
- The name of the feactures variables is added to the X_test file
- The mean and standard deviation are calculated for the test data (X_test)
- The name of the feactures variables is added to the X_train file
- The mean and standard deviation are calculated for the test data (X_test)
- Test and training files are merged
- The mean and standard deviation are calculated for the test + training data
- A field is added to the file tag id, the name of the tag variable, in test data
- The variables of the tag id file (y_test) and the operator file (subject_test) are renamed
- A field is added to the file tag id, the name of the tag variable, in training data
- The variables of the tag id file (y_train) and the operator file (subject_train) are renamed
- Test data, labels and operator are linked
- Training data, labels and operator are linked
- Test and training data are merged
- A new file is created and the ordered and independent data are added, with an average of each variable for each activity.
_ the file is exported with the data of the previous item.

 