# Create a simple MCMC sampler
x <- seq(1, 10, by = 1)
e <- rnorm(length(x))
y <- 0.5 + 5 * x + e
plot(y ~ x)
y
# prior 
a[1] = 1
b[1] = 1
for(i in 1:10){
b[i] <- (y[i] - a[i] - rnorm(1))/x[i]
b
a[i] <-  y - b[i]*x[i] - rnorm(1)
}
a
b
plot(y ~ x)
abline(a = mean(a), b = mean(b))
