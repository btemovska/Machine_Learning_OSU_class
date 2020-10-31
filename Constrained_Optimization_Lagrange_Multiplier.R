install.packages("Rsolnp")
library(Rsolnp)
# fn1 return the value of value of the function by taking x as input vector
fn1=function(x){ x[1]^2+2*x[2]^2+5*x[3]^2}
#eqn1 is the function that returns the constraint
eqn1=function(x){
  z1 = x[1]+x[2]+x[3]
  return(c(z1))
}
#initial values
x0 = c(0,0,0)
x_optimal = solnp(x0, fun = fn1, eqfun = eqn1, eqB = c(2))
##Iter: 1 fn: 1.9097	 Pars:  1.06946 0.51417 0.21782
#Iter: 2 fn: 2.3529	 Pars:  1.17647 0.58824 0.23529
#Iter: 3 fn: 2.3529	 Pars:  1.17647 0.58824 0.23529
#solnp--> Completed in 3 iterations

x_optimal$pars
#1.1764706 0.5882353 0.2352941

x_optimal$convergence
# 0

x_optimal$values
#0.000000 1.909693 2.352941 2.352941

x_optimal$lagrange

#       [,1]
#[1,] 2.352942


x_optimal$hessian
#        [,1]      [,2]       [,3]
#[1,]  1.9084214 -1.019843 -0.5157249
#[2,] -1.0198432  2.209799 -1.3718505
#[3,] -0.5157249 -1.371851  9.0934124

x_optimal$elapsed
#Time difference of 0.04440808 secs




