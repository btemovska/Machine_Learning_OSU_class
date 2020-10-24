library(Matrix)
install.packages("psych")
library(psych) 

A<-matrix(c(8, -1, 2, -1, 2, -2, 2, -2, 3),3,3,byrow = TRUE)
A
#     [,1] [,2] [,3]
#[1,]    8   -1    2
#[2,]   -1    2   -2
#[3,]    2   -2    3

#compute the determinant
det(A)#Eigen#13

#rank
rankMatrix(A) #3
#maximum number of linearly independed columns or rows of matrix A is 2

#Eigenvalues of matrix A
eigenvalues<-eigen(A)
#Eigenvectors of matrix A
eigenvectors<-eigenvalues$vectors
eigenvalues
#eigen() decomposition
#$values
#[1] 9.0847569 3.5072388 0.4080043

#$vectors
#           [,1]       [,2]        [,3]
#[1,]  0.8989580 -0.4326343 -0.06857203
#[2,] -0.2318077 -0.6026902  0.76356379
#[3,]  0.3716716  0.6705162  0.64208116

isSymmetric(A) #TRUE
#Yes matrix A is positive since it is Symmetric and 
#and all eigenvalues are positive

trace <- tr(A)
trace #13

W <- A^2
W
#     [,1] [,2] [,3]
#[1,]   64    1    4
#[2,]    1    4    4
#[3,]    4    4    9
