#Load the data set.
df<-read.csv("D:/FSU/Machine learning/Project/processed_cleveland.csv",header = FALSE)
df

#Renamed Columns.
colnames(df)<-c("age","sex","cp","trestbps","chol","fbs","restecg",
                "thalach","exang","oldpeak","slope","ca","thal","num")
colnames(df)

#Check the structure of the data set.
str(df)

#Checking the summary of the data set.
summary(df)

df$predicted_attribute<-ifelse(df$num>0,1,0)
df$predicted_attribute

df<-subset(df,select = -c(num))
df

library("caret")
library("class")

#Train - test split
set.seed(123)
trainindex<-createDataPartition(df$predicted_attribute,p=0.7,list = FALSE,times = 1)
trainindex

trainData<-df[trainindex,]
trainData

testData<-df[-trainindex,]
testData

# Separate the test labels from the test data.
test_labels<-testData$predicted_attribute
test_labels

test_Data<-testData[,-which(names(testData)=="predicted_attribute")]
test_Data

#Train the model.
install.packages("randomForest")
library(randomForest)

rfModel<-randomForest(predicted_attribute~.,data=trainData)
rfModel

testPred<-predict(rfModel,test_Data)
testPred

#Compare the predicted and actual values.
confMatrix<-table(testPred,test_labels)
confMatrix














