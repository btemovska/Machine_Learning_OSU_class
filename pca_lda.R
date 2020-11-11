require(MASS)
require(ggplot2)
require(scales)
require(gridExtra)
head(iris)
pca <- prcomp(iris[,-5],center = TRUE,scale = TRUE)
summary(pca)
prop.pca = pca$sdev^2/sum(pca$sdev^2)
prop.pca
lda <- lda(Species ~ .,
           iris)
prop.lda = lda$svd^2/sum(lda$svd^2)
prop.lda
pred_lda <- predict(object = lda,
                    newdata = iris)
mean(pred_lda$class==iris[,5])


dataset = data.frame(species = iris[,"Species"],
                     pca = pca$x, lda = pred_lda$x)
head(dataset)
p1 <- ggplot(dataset) + geom_point(aes(lda.LD1, lda.LD2, colour = species, shape = species), size = 1.5) +
  labs(x = paste("LD1 (", percent(prop.lda[1]), ")"),
       y = paste("LD2 (", percent(prop.lda[2]), ")"))
p2 <- ggplot(dataset) + geom_point(aes(pca.PC1, pca.PC2, colour = species, shape = species), size = 1.5) +
  labs(x = paste("PC1 (", percent(prop.pca[1]), ")"),
       y = paste("PC2 (", percent(prop.pca[2]), ")"))

grid.arrange(p1, p2)
