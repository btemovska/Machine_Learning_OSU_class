library(numDeriv)
x<-2
y<-3
z<-4
f <- function(x,y,z) {
  x*y*z + sin(y*z)+ exp(x*y)
}

gradient <- grad(f, x=1:1, y=1:1, z=1:1)
gradient #3.718282
hessian <- hessian(f, x=1:1, y=1:1, z=1:1)
hessian
#         [,1]
#[1,] 2.718282

