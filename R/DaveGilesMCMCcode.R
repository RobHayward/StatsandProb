set.seed(123)       # set the seed for the random number generator 
# so we all get the same results
nrep<- 105000       # Total number of MC replications
nb<- 5000           # Number of observations for the "Burn-in"
yy1<- array(,nrep)
yy2<- array(,nrep)

rho<- 0.5           # Set correlation between Y1 and Y2. You can vary this.
sd<- sqrt(1-rho^2)

y1<- rnorm(1,0,sd)  #initialize Y1
# Start the Gibbs sampler loop
for (i in 1:nrep) {
  y2<-  rnorm(1,0,sd)+rho*y1
  y1<-  rnorm(1,0,sd)+rho*y2
  yy1[i]<- y1
  yy2[i]<- y2
  
}                 # End of the Gibbs sampler loop

# Drop the first "nb" repetitions for the "Burn-in". 
# (We'll have 100,000 values to analyze.)
nb1<- nb+1
yy1b<-yy1[nb1:nrep]
yy2b<- yy2[nb1:nrep]

plot(yy1b, col=2, main="MCMC for Bivariate Normal - Part 1", xlab="Repetitions", ylab="Y1")
abline(h=3,lty=2)
abline(h=-3,lty=2)
plot(yy2b, col=4, main="MCMC for Bivariate Normal - Part 2", xlab="Repetitions", ylab="Y2")
abline(h=3,lty=2)
abline(h=-3,lty=2)

summary(yy1b)
var(yy1b)
summary(yy2b)
var(yy2b)

hist(yy1b, prob=T,col=2, main="MCMC for Bivariate Normal - Part 1", xlab="Y1", 
     ylab="Marginal PDF for Y1")
hist (yy2b,prob=T,col=4, main="MCMC for Bivariate Normal - Part 2", xlab="Y2", 
      ylab="Marginal PDF for Y2")

qqnorm(yy1b)
qqline(yy1b,col=2)
qqnorm(yy2b)
qqline(yy2b,col=4)

library(tseries)
jarque.bera.test(yy1b)
jarque.bera.test(yy2b)
  