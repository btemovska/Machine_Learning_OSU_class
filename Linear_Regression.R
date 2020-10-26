library(ggplot2)
ggplot(data = mtcars, aes(x = disp, y = mpg)) +
  geom_point(colour = "red")
cor(mtcars$disp, mtcars$mpg) # -0.8475514

#fit the regression line
ggplot(data = mtcars, aes(x = disp, y = mpg)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)

#linear model
lmodel <- lm(mpg ~ disp, data = mtcars)
lmodel
#Call:
#lm(formula = mpg ~ disp, data = mtcars)

#Coefficients:
#  (Intercept)         disp  
#29.59985     -0.04122  

#summary
summary(lmodel)
##
## Call:
## lm(formula = mpg ~ disp, data = mtcars)
##
## Residuals:
## Min 1Q Median 3Q Max
## -4.8922 -2.2022 -0.9631 1.6272 7.2305
##
## Coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 29.599855 1.229720 24.070 < 2e-16 ***
## disp -0.041215 0.004712 -8.747 9.38e-10 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
##
## Residual standard error: 3.251 on 30 degrees of freedom
## Multiple R-squared: 0.7183, Adjusted R-squared: 0.709
## F-statistic: 76.51 on 1 and 30 DF, p-value: 9.38e-10

gradientDesc <- function(x, y, learn_rate, n, max_iter) {
  m <- runif(1, 0, 1)
  c <- runif(1, 0, 1)
  yhat <- m * x + c
  iterations = 0
  while(iterations<max_iter) {
    ## Implement the gradient descent algorithm
    m <- m - learn_rate * ((2 / n) * (sum((yhat - y) * x)))
    c <- c - learn_rate * ((2 / n) * (sum(yhat - y)))
    yhat <- m * x + c
    iterations = iterations + 1
  }
  return(paste("Optimal intercept:", c, "Optimal slope:", m))
}
gradientDesc(mtcars$disp, mtcars$mpg, 0.00001, 32, 4000000)
## [1] "Optimal intercept: 29.5998540199727 Optimal slope: -0.0412151174690612"