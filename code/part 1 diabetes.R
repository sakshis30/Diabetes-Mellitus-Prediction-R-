#Reading data
diabetes<- read.csv("C:/Users/SAKSHI/Desktop/New Folder/diabetes data.csv")
str(diabetes)
summary(diabetes)

#Data Exploration

#We can see that there are almost twice as many people wihtout diabetes than there are with diabetes.
diabetes$Outcome <- as.factor(unlist(diabetes$Outcome)) 
diabetes$Outcome <- factor(diabetes$Outcome, levels=c("1", "0"),
                           labels = c("Positive", "Negative")) 
summary(diabetes$Outcome)

#plot Graphically
ages<-train %>% group_by(as.factor(Age),as.factor(Outcome)) %>% summarise(Outcome = n())
names(ages)<-c("Age","Outcome","NumberOfPeople")
library(ggplot2)
ggplot(ages,aes(Age,NumberOfPeople))+geom_bar(aes(fill = Outcome), position = "dodge", stat='identity')+ 
  scale_x_discrete(breaks=seq(21, 81, 1))+labs(title="Number of Diabeteics vs Non-Diabetics by Age")
png(file= "hell.jpg")
dev.off()


# 1. Pregnancies
library(ggplot2)

pregs<-train %>% group_by(as.factor(Pregnancies),as.factor(Outcome)) %>% summarise(Outcome = n())
names(pregs)<-c("TimesPregnant","Outcome","NumberOfPeople")
ggplot(pregs,aes(TimesPregnant,NumberOfPeople))+geom_bar(aes(fill = Outcome), 
                   position = "dodge", stat='identity')+
                   scale_x_discrete(breaks=seq(0, 17, 2))+
                  labs(title="Number of Diabeteics vs Non-Diabetics by Number of Times Pregnant")


#2.Glucose

p2 <- ggplot(data=diabetes, aes(x = Glucose, color = Outcome, fill = Outcome)) +
  geom_histogram(binwidth = 5) +
  theme(legend.position = "bottom") +
  labs(x = "Glucose", y = "Density", title = "Variation of glucose vs Outcome")

p1 <- ggplot(data=diabetes, aes(x = Outcome, y = Glucose,fill = Outcome)) +
  geom_boxplot() +
  theme(legend.position = "bottom") +
  ggtitle("Variation of glucose in women Vs Outcome")

gridExtra::grid.arrange(p1, p2, ncol = 2)


#3.Blood Pressure

p2 <- ggplot(data=diabetes, aes(x = BloodPressure, color = Outcome, fill = Outcome)) +
  geom_histogram(binwidth = 3) +
  theme(legend.position = "bottom") +
  labs(x = "Blood pressure", y = "Density", title = "Variation of Blood pressure vs Outcome")

p1 <- ggplot(data=diabetes, aes(x = Outcome, y = BloodPressure,fill = Outcome)) +
  geom_boxplot() +
  theme(legend.position = "bottom") +
  ggtitle("Variation of blood pressure in women Vs Outcome")

gridExtra::grid.arrange(p1, p2, ncol = 2)

#4.Skin Thickness

p2 <- ggplot(data=diabetes, aes(SkinThickness, fill = Outcome)) +
  geom_histogram(binwidth = 3) +
 theme(legend.position = "bottom") +
  labs(x = "Outcome", y = "Skin Thickness", title = "Variation of Skin Thickness vs Outcome")
print(p2)

  
p1 <- ggplot(data=diabetes, aes(x = Outcome, y = SkinThickness,fill = Outcome)) +
  geom_boxplot() +
  theme(legend.position = "bottom") +
  ggtitle("Variation of skin thickness in women Vs Outcome")
print(p1)

gridExtra::grid.arrange(p1, p2, ncol = 2)

#5.Insulin

p1 <- ggplot(data=diabetes, aes(x = Outcome, y = Insulin,fill = Outcome)) +
  geom_boxplot() + 
  theme(legend.position = "bottom") +
  ggtitle("Variation of Insulin content Vs Outcome")
print(p1)

p2 <- ggplot(data=diabetes, aes(Insulin, fill = Outcome)) +
  geom_histogram(binwidth=10) +
  theme(legend.position = "bottom") +
  ggtitle("Variation of Insulin content Vs Outcome")
print(p2)
gridExtra::grid.arrange(p1, p2, ncol = 2)

#6.BMI

p2 <- ggplot(data=diabetes, aes(BMI, fill = Outcome)) +
  geom_histogram() +
  theme(legend.position = "bottom") +
  ggtitle("Variation of BMI of women Vs Outcome")

p1 <- ggplot(data=diabetes, aes(x = Outcome, y = BMI,fill = Outcome)) +
  geom_boxplot(binwidth = 5) +
  theme(legend.position = "bottom") +
  ggtitle("Variation of BMI of women Vs Outcome")

gridExtra::grid.arrange(p1, p2, ncol = 2)

#7.DPF
p1 <- ggplot(data=diabetes, aes(x = Outcome, y = DiabetesPedigreeFunction,fill = Outcome)) +
  geom_boxplot() +
  theme(legend.position = "bottom") +
  ggtitle("Variation of DPF of women Vs Outcome")


p2 <- ggplot(data=diabetes, aes(DiabetesPedigreeFunction,fill = Outcome)) +
  geom_histogram(binwidth=1) +
  theme(legend.position = "bottom") +
  ggtitle("Variation of DPF Vs Outcome")


gridExtra::grid.arrange(p1, p2, ncol = 2)

#8.Age
p2 <- ggplot(data=diabetes, aes(x=Age, fill = Outcome)) +
  geom_histogram(binwidth=3) +
  theme(legend.position = "bottom") +
  ggtitle("Variation of Age of women Vs Outcome")
print(p2)
p1 <- ggplot(data=diabetes, aes(x = Outcome, y = Age,fill = Outcome)) +
  geom_boxplot() +
  theme(legend.position = "bottom") +
  ggtitle("Variation of Age of women Vs Outcome")

gridExtra::grid.arrange(p1, p2, ncol = 2)


#Bi-Variate Assosciation
#1)Relationship of Pregnancies with Age vs Diabetes
p1 <- ggplot(data=diabetes, aes(x = Age, y = Pregnancies)) +
  geom_point(aes(color=Outcome)) + 
  theme(legend.position = "bottom") +
  ggtitle("Relationship of Pregnancies with Age Vs Diabetes")

#2)Relationship of Insulin with Glucose vs Diabetes
p2 <- ggplot(data=diabetes,aes(x=Insulin,y=Glucose))+
  geom_point(aes(color=Outcome))+
  theme(legend.position = "bottom") +
  ggtitle("Relationship of Insulin with Glucose Vs Diabetes")

gridExtra::grid.arrange(p1, p2, ncol = 2)


#3)Relationship of BMI with BP vs Diabetes
p1 <- ggplot(data=diabetes,aes(x=BMI,y=BloodPressure))+
  geom_point(aes(color=Outcome))+
  theme(legend.position = "bottom") +
  ggtitle("Relationship of BMI with BP Vs Diabetes")

#4)Relationship of BMI with Skin Thickness vs Diabetes
p2 <- ggplot(data=diabetes,aes(x=BMI,y=SkinThickness))+
  geom_point(aes(color=Outcome))+
  theme(legend.position = "bottom") +
  ggtitle("Relationship of BMI with Skin Thickness Vs Diabetes")

gridExtra::grid.arrange(p1, p2, ncol = 2)

#Correlation between all the variables.
library(corrplot)
corMat = cor (diabetes[, -9])
diag (corMat) = 0 #Remove self correlations
corrplot.mixed(corMat,tl.pos = "lt")

