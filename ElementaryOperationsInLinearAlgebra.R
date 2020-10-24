# Create a matrix A
A<-matrix(c(2,-1,0,-1,2,-1,0,-1,2),3,3,byrow = TRUE)

# Output the matrix A
A
#     [,1] [,2] [,3]
#[1,]    2   -1    0
#[2,]   -1    2   -1
#[3,]    0   -1    2

# Find the determinant of matrix A
det(A) #4

## Check whether matrix A is symmetric or not. 
#It returns TRUE if the matrix is symmetric.
isSymmetric(A) #TRUE

# Find the eigen values of a matrix A
eigenvalues <- eigen(A)
# Find the eigen vectors of matrix A
eigenvectors <- eigenvalues$vectors
# Generate the output of the eigen values and eigen vectors of matrix A
eigenvalues
#eigen() decomposition
#$values
#[1] 3.4142136 2.0000000 0.5857864

#$vectors
#[,1]          [,2]      [,3]
#[1,] -0.5000000 -7.071068e-01 0.5000000
#[2,]  0.7071068  1.099065e-15 0.7071068
#[3,] -0.5000000  7.071068e-01 0.5000000
