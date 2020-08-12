
Orderly description of the data set
Variables in ordered data
Sorted data contains 180 rows and 566 columns; has averaged variables
by topic and activity. The estimated variables of the mean and deviation were maintained.
standard in ordered set.

USED LIBRARIES:

library(dplyr)
library(plyr)
library(car)
library(data.table)
library(reshape2) 

FILES USED:

training:        Training data
activity_labels: Label file
features: 	 Feature file
test:		 Test Data
y_test: 	 Test labels
y_train: 	 Training tag file
subject_test: 	 Test operator file
subject_train:   Operator training file
test_data: 	 Consolidated test file with additional variables
train_data:	 Consolidated training file with additional variables
data: 		 File with test and training data
data_dw: 	 File with test and training data with additional variables to export
tidy_data: 	 Exported txt file
mean_test:	 File with test mean data
sd_test:	 File with test standard deviation data
mean_train:      File with training mean data
sd_train:	 File with training standard deviation data
md_data:	 File with test + training mean data
sd_data:	 File with test + training standard deviation data 

VARIABLES:

tidy_data


FUNCTIONS USED:


cbind()
rbind()
read.table()
intersect()
merge()   
sapply()
colnames()
names()
write.table()
aggregate()
mean()
sd()
names()



 