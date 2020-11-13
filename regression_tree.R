install.packages("rsample")
library(rsample)
library(dplyr) 
library(rpart) 
install.packages("rpart.plot")
library(rpart.plot) 
library(ipred) 
library(caret)
install.packages("AmesHousing")
library(AmesHousing)

head(AmesHousing::make_ames())
set.seed(123)
ames_split <- initial_split(AmesHousing::make_ames(), prop = .7)
ames_train <- training(ames_split)
ames_test <- testing(ames_split)
m1 <- rpart(
  formula = Sale_Price ~ .,
  data = ames_train,
  # when fitting a regression tree, we need to set method = "anova"
  method = "anova"
)
m1
rpart.plot(m1)
plotcp(m1)
m2 <- rpart(
  formula = Sale_Price ~ .,
  data = ames_train,
  method = "anova",
  control = list(cp = 0, xval = 10)
)
plotcp(m2)
abline(v = 12, lty = "dashed")
pred <- predict(m1, newdata = ames_test)
RMSE(pred = pred, obs = ames_test$Sale_Price)
