# causes of extramarital affairs.
# https://freakonometrics.hypotheses.org/56400
  # use da instead of base:w
base <- read.table("http://freakonometrics.free.fr/baseaffairs.txt",header=TRUE)
head(da)
df <- data.frame(y = base$Y, religion = as.factor(base$RELIGIOUS), 
                 occupation = as.factor(base$OCCUPATION), expo = 1)
(E <- xtabs(expo ~ religion + occupation, data = df))
(N = xtabs(y ~ religion + occupation, data = df))
sum(N)/sum(E)
A = rep(1, length(levels(df$religion)))
B = rep(1, length(levels(df$occupation)))*sum(N)/sum(E)
A
B
E * A%*%t(B)
sum(B*E[1,])
sum(B*E[2,])
apply(t(B^t(E)), 1, sum)
# to be continued
