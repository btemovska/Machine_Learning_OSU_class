head(iris)
X<- subset(iris,select=c(1,2,3,4))
X = data.matrix(X)
normalize <- function(x) {apply(x, 2, function(y) y - mean(y))}
data_mean = colMeans(X)
normalized_dataset = normalize(X)
colSums(normalized_dataset)
X <- normalized_dataset
svd_normalized_dataset = svd(X)
U <- svd_normalized_dataset$u
(diagonal_D <- svd_normalized_dataset$d)
(V <- svd_normalized_dataset$v)
(pca_X = U %*% diag(diagonal_D))
(covariance_X = cov(normalized_dataset))
(covariance_X_eigenvectors = eigen(covariance_X)$vectors)
(pca_X = X%*%covariance_X_eigenvectors)

var(pca_X[,1])
var(pca_X[,2])
var(pca_X[,3])
var(pca_X[,4])
cor(X[,1],X[,2])
cor(pca_X[,1],pca_X[,2])
(low_dimensional_X = pca_X[,c(1,2)])
