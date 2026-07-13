# Diabetes-Mellitus-Prediction-R

# 🩺 Diabetes Mellitus Prediction using Machine Learning in R

A machine learning project that predicts the onset of diabetes using supervised learning algorithms implemented in **R**. The project compares Logistic Regression and Decision Tree models on the Pima Indians Diabetes Dataset to identify the most effective classifier for diabetes prediction.

## ℹ️ About this Repository

This repository contains the implementation of a machine learning approach for diabetes prediction developed as part of an undergraduate research project. The implementation has been organized for educational and portfolio purposes while preserving the methodology presented in the associated publication.

## 📌 Project Overview

Early diagnosis of diabetes plays a crucial role in improving patient outcomes and reducing healthcare risks. This project applies machine learning techniques to predict whether an individual is likely to have diabetes based on diagnostic measurements.

The implementation focuses on comparing two supervised learning algorithms:

- Logistic Regression
- Decision Tree

The models are evaluated using standard classification metrics to determine their predictive performance.


## 📂 Dataset

The project uses the **Pima Indians Diabetes Dataset**, which contains medical information collected from female patients.

The dataset includes attributes such as:

- Number of Pregnancies
- Plasma Glucose Concentration
- Blood Pressure
- Skin Thickness
- Serum Insulin
- Body Mass Index (BMI)
- Diabetes Pedigree Function
- Age

Target Variable:

- Diabetes Outcome (Positive / Negative)


## ⚙️ Methodology

The workflow includes:

- Data preprocessing
- Feature selection
- Train-test split (70:30)
- Logistic Regression
- Decision Tree Classification
- Model comparison


## 📊 Model Evaluation

Performance is evaluated using:

- Confusion Matrix
- Accuracy
- Sensitivity
- Specificity
- Precision
- Recall

The project compares both models based on predictive accuracy.


## 🛠️ Technologies Used

- R
- caret
- tree
- e1071
- ggplot2

## 📁 Repository Structure

```
Diabetes-Mellitus-Prediction-R/

├── code/
│     └── diabetes_prediction.R
│
├── paper/
│     └── conference_paper.pdf
│
├── images/
│
├── requirements.md
│
└── README.md
```



## 📈 Results

The comparative analysis demonstrated that Logistic Regression achieved higher predictive accuracy than the Decision Tree model for this dataset.

## 🚀 Future Improvements

- Random Forest
- XGBoost
- Support Vector Machine
- Cross-validation
- Hyperparameter tuning
- Shiny web application

## 📄 Related Publication

This repository accompanies the research work:

**Interpretation of Models on the Onset of Diabetes using Machine Learning**

The implementation presented in this repository is based on the methodology described in the accompanying conference paper. This project reflects the original implementation developed during undergraduate research in 2020. It has been preserved as part of my portfolio to document my work in healthcare machine learning using R.
