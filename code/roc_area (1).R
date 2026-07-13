#ROC Plot of the accuracy
library(mlbench)
data <- read.csv("C:/Users/SAKSHI/Desktop/New Folder/diabetes data.csv")

library(nnet)
fit <- multinom(Outcome ~., data = data1)pred <- predict(fit,data1)
#confusion matrix for the predicted results
tab <- table(pred,data$Outcome)
tab
library("ROCR")
library("caret")
pred <- predict(fit, data,type='prob')  #type fit
pred <- prediction(pred,data$Outcome)
#hist(pred)

eval <- performance(pred, 'acc')
plot(eval)
abline(h=0.77,v = 0.4)

#tpr vs fpr

roc <- performance(pred,"tpr","fpr")
plot(roc)
abline(a=0,b=1)
# Calculating Area under Curve
perf <- performance(pred,"auc")
auc <- as.numeric(perf@y.values)
auc

