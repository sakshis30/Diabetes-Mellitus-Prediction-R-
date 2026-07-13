#Using Logistic Regression
pima<- read.csv("C:/Users/SAKSHI/Desktop/New Folder/diabetes data.csv")
str(pima)
summary(pima)


library(caret)
library(tree)
library(e1071)
set.seed(123)

st=Sys.time()
n <- nrow(pima)
intrain <- sample(n, trunc(0.70*n))
train <- pima[intrain, ]
test <- pima[-intrain, ]

glm_fm1 <- glm(Diabetes ~., data = pima_training, family = binomial)
summary(glm_fm1)

glm_fm2 <- update(glm_fm1, ~. - Triceps_Skin - Serum_Insulin - Age )
summary(glm_fm2)

par(mfrow = c(2,2))
plot(glm_fm2)


ktime<- Sys.time()
time= ktime-st

print(time)

# Training The Model
library(caret)
glm_probs <- predict(glm_fm2, newdata = pima_testing, type = "response")
glm_pred <- ifelse(glm_probs > 0.5, 1, 0)
#print("Confusion Matrix for logistic regression"); table(Predicted = glm_pred, Actual = pima_testing$Diabetes)
confusionMatrix(as.factor(glm_pred), as.factor(pima_testing$Outcome))



acc_glm_fit <- confusionMatrix(as.factor(glm_pred), as.factor(pima_testing$Outcome))$overall['Accuracy']
#Using Decision Tree

# Training The Model
diabetes <- read.csv("C:/Users/SAKSHI/Desktop/New Folder/diabetes data.csv")
diabetes$Outcome <- as.factor(diabetes$Outcome)

library(caret)
library(tree)
library(e1071)
set.seed(1000)
intrain <- createDataPartition(y = diabetes$Outcome, p = 0.5, list = FALSE)
train <- diabetes[intrain, ]
test <- diabetes[-intrain, ]

# Training The Model
treemod <- tree(Outcome ~ ., data = train)

summary(treemod)
treemod 
plot(treemod)
text(treemod, pretty = 0)

tree_pred <- predict(treemod, newdata = test, type = "class" )
confusionMatrix(tree_pred,test$Outcome)

acc_treemod <- confusionMatrix(as.factor(tree_pred), as.factor(test$Outcome))$overall['Accuracy'] 


#Comparison of Model Accuracy
library(ggplot2)
accuracy <- data.frame(Model=c("Logistic Regression","Decision Tree"),
                       Accuracy=c(acc_glm_fit, acc_treemod))
ggplot(accuracy,aes(x=Model,y=Accuracy)) + geom_bar(stat='identity') + theme_bw() + ggtitle('Comparison of Model Accuracy')


