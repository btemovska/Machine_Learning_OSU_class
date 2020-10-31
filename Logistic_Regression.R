sigmoid <- function(x){
  return(1/(1+exp(-x)))
}
x <- seq(-6, 6, length.out = 101)
y1 <- sigmoid(x)
plot(x, y1, type = "l", col = "darkblue",
     xlab = "x", ylab = "y", main = "Sigmoid function")
data(BreastCancer, package="mlbench")
bc <- BreastCancer[complete.cases(BreastCancer), ] # keep complete rows
head(bc)
## Id Cl.thickness Cell.size Cell.shape Marg.adhesion Epith.c.size
## 1 1000025 5 1 1 1 2
## 2 1002945 5 4 4 5 7
## 3 1015425 3 1 1 1 2
## 4 1016277 6 8 8 1 3
## 5 1017023 4 1 1 3 2
## 6 1017122 8 10 10 8 7
## Bare.nuclei Bl.cromatin Normal.nucleoli Mitoses Class
## 1 1 3 1 1 benign
## 2 10 3 2 1 benign
## 3 2 3 1 1 benign
## 4 4 3 7 1 benign
## 5 1 3 1 1 benign
## 6 10 9 7 1 malignant


#Preprocessing the dataset
# remove the Id column
bc <- bc[,-1]
# Change label values to 1's and 0's(1 for "malignant", 0 otherwise)
bc$Class <- ifelse(bc$Class == "malignant", 1, 0)
bc$Class <- factor(bc$Class, levels = c(0, 1))
# convert to numeric
for(i in 1:10) {
  bc[, i] <- as.numeric(as.character(bc[, i]))
}


#Plot the correlation between attributes
# plot the correlation between attribute
library(corrplot)
## corrplot 0.84 loaded
par(cex = 0.7)
corrplot(cor(bc), method="number")

#Split the training set and test set
# Prep Training and Test data.
library(caret)
## Loading required package: lattice
## Loading required package: ggplot2
set.seed(100)
trainDataIndex <- createDataPartition(bc$Class, p=0.7, list = F)
trainData <- bc[trainDataIndex, ]
testData <- bc[-trainDataIndex, ]
# Class distribution of train data
table(trainData$Class)
##
## 0 1
## 312 167
table(testData$Class)
##
## 0 1
## 132 72



#Build logistic model
#only select three attributes that have highest correlation with attribute "class". You can add more attribute to improve accuracy.
logitmod <- glm(Class ~ Cell.size + Cell.shape + Bare.nuclei, family = "binomial", data=trainData)
summary(logitmod)
##
## Call:
## glm(formula = Class ~ Cell.size + Cell.shape + Bare.nuclei, family = "binomial",
## data = trainData)
##
## Deviance Residuals:
## Min 1Q Median 3Q Max
## -4.3149 -0.1146 -0.1146 0.0146 2.1233
##
## Coefficients:
## Estimate Std. Error z value Pr(>|z|)
## (Intercept) -7.0774 0.7851 -9.014 < 2e-16 ***
## Cell.size 0.6833 0.2139 3.194 0.0014 **
## Cell.shape 0.7322 0.2292 3.194 0.0014 **
## Bare.nuclei 0.6390 0.1122 5.695 1.24e-08 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
##
## (Dispersion parameter for binomial family taken to be 1)
##
## Null deviance: 619.445 on 478 degrees of freedom
## Residual deviance: 88.075 on 475 degrees of freedom
## AIC: 96.075
##
## Number of Fisher Scoring iterations: 8


# Predict on the test set.
pred <- predict(logitmod, newdata = testData, type = "response")
# Convert probability to class. 1 if > 0.5, o otherwise.
y_pred_num <- ifelse(pred > 0.5, 1, 0)
y_pred <- factor(y_pred_num, levels=c(0, 1))
y_act <- testData$Class
# Calculate accuracy
mean(y_pred == y_act)
## [1]  0.9313725






