# Create a simple MCMC sampler

x <- seq(1, 100, by = 1)
e <- rnorm(length(x))
y <- 0.5 + 5 * x + e
plot(y ~ x)
y
# prior 
a <- rep(NA, times = length(x))
b <- rep(NA, times = length(x))
a[1] = 1
b[1] = 1
for(i in 2:100){
b[i] <- (y[i] - a[i-1] - rnorm(1))/x[i]
a[i] <-  y[i] - b[i]*x[i] - rnorm(1)
}
a
b
plot(y ~ x, type = 'l')
abline(a = mean(a), b = mean(b))
lines(fitted(lm(y ~x)), col = 'red')
  
