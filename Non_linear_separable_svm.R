x <- matrix(rnorm(200*2), ncol = 2)
x[1:100,] <- x[1:100,] + 2
x[101:150,] <- x[101:150,] - 2
y <- c(rep(1,150), rep(2,50))
dat <- data.frame(x=x,y=as.factor(y))
# Plot data
ggplot(data = dat, aes(x = x.2, y = x.1, color = y, shape = y)) +
  geom_point(size = 2) + scale_color_manual(values=c("#000000", "#FF0000")) +
  theme(legend.position = "none")
# set pseudorandom number generator
set.seed(123)
# kernel "radial" means gaussian kernel
svmfit <- svm(y~., data = dat, kernel = "radial", gamma = 1, cost = 10)
# plot classifier
plot(svmfit, dat)

svmfit
##
## Call:
## svm(formula = y ~ ., data = dat, kernel = "radial", gamma = 1,
## cost = 10)
##
##
## Parameters:
## SVM-Type: C-classification
## SVM-Kernel: radial
## cost: 10
## gamma: 1
##
## Number of Support Vectors: 54
ypred <- predict(svmfit, dat)
(misclass <- table(predict = ypred, truth = dat$y))
#         truth
#predict   1   2
#          1 144   8
#         2   6  42



