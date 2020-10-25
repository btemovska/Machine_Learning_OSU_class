#example 1 dimensional function
#first, let's define this function
f<-function(x) {(x-2)^2+ 5}
#visualize this function
x=seq(0, 4, 0.1)
y=f(x)
plot(x,y,type="l", lty=2)

grad <- function(x){2*(x-2)}
x <- 0
x_traj <- x
alpha <- 0.2
for(iter in 1:100){
  x <- x - alpha*grad(x)
  x_traj <- c(x_traj,x)
  # stopping criteria
  len = length(x_traj)
  if (x_traj[len]-x_traj[len-1]<0.001){
    break
  }
}
x_traj
# [1] 0.000000 0.800000 1.280000 1.568000 1.740800 1.844480 1.906688 
# 1.944013 1.966408
# 1.979845 1.987907 1.992744 1.995646 1.997388 1.998433 1.999060

#Show the trajectory alone with the function plot:
x = seq(0,4,0.1)
y = f(x)
# xlim is added to make sure the axis of two plots are consistant
plot(x,y,xlim=range(0,4),type="l", lty=2)
par(new=TRUE)
plot(x_traj,f(x_traj),xlim=range(0,4),axes = FALSE, xlab = "", ylab = "")
s <- seq(length(x_traj))
arrows(x_traj[s], f(x_traj)[s], x_traj[s+1], f(x_traj)[s+1], col="red")
## Warning in arrows(x_traj[s], f(x_traj)[s], x_traj[s + 1], f(x_traj)[s + :
## zero-length arrow is of indeterminate angle and so skipped
