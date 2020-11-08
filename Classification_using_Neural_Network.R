data(iris)
head(iris)

library(ggplot2)
#plot Sepal Length-Width
scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) 


scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") + ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

#plot Petal Length-Width
scatter <- ggplot(data=iris, aes(x = Petal.Length, y = Petal.Width))
scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Petal Length") + ylab("Petal Width") +
  ggtitle("Petal Length-Width")

index <- sample(1:nrow(iris),round(0.85*nrow(iris)))

train_dataset <- iris[index,]
test_dataset <- iris[-index,]

install.packages("neuralnet")
library(neuralnet)
train_dataset$setosa = train_dataset$Species == "setosa"
train_dataset$virginica = train_dataset$Species == "virginica"
train_dataset$versicolor = train_dataset$Species == "versicolor"

model = neuralnet(versicolor + virginica + setosa~ Sepal.Length + Sepal.Width
                  + Petal.Length + Petal.Width, train_dataset, hidden=c(4,2),linear.output = FALSE)
model$result.matrix
plot(model)

temp_test <- subset(test_dataset,select = c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width"))

results <- compute(model,temp_test)
results$net.result

preds <- factor(c( "versicolor", "virginica","setosa"))[apply(results$net.result, MARGIN=1, FUN=which.max)]
table(preds, test_dataset$Species)
#preds        setosa versicolor virginica
#setosa          8          0         0
#versicolor      0          8         1
#virginica       0          0         5
#one false prediction
