library(numDeriv)
f <- function(x) {
  x1 <- x[1]; x2 <- x[2]; x3 <- x[3]
  sin(x1*x2)+cos(x3)
}
gradient <- grad(f,x=1:3)
hess <- hessian(f,x=1:3)

#Output the gradient
gradient # -0.8322937 -0.4161468 -0.1411200

#Output the hassian
hess
#              [,1]          [,2]          [,3]
#[1,] -3.637190e+00 -2.234742e+00 -1.353697e-17
#[2,] -2.234742e+00 -9.092974e-01 -6.768483e-18
#[3,] -1.353697e-17 -6.768483e-18  9.899925e-01
