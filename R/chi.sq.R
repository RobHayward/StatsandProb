# http://freakonometrics.hypotheses.org/17491
N = margin.table(HairEyeColor, c(1, 2))
N
n = sum(N)
round(N/n, 2)
NHair = apply(N, 1, sum)
NEye = apply(N, 2, sum)
Nind <- NHair%*%t(NEye)/n
Nind/n
Nind
X <- (N - Nind)^2/Nind
Qobs <- sum(X)
Qobs
X
1-pchisq(Qobs, df = (ncol(N) - 1)*(nrow(N) - 1))
chisq.test(N)
chisq.test(N)$expected
