library(tidyverse)
library(haven)
library(backpack)

qs <- bacpac_csv("testdata:Canonical:QSMD.csv");
dm <- bacpac_csv("testdata:Canonical:DM.csv");

#Keep the needed variables and records
qs2<-qs %>% 
  filter(QSTESTCD=="PRDEP4AR", VISITNUM==0) %>% 
  left_join(dm %>% select(USUBJID, AGE)) %>% 
  select(USUBJID, QSTESTCD, QSSTRESN, AGE)

#Need to replace current values of PRDEP4AR with ones that are correlated with AGE
#Values of PRDEP4AR can be between 4 and 20

#Lets just take a quick look at this
ggplot(qs2, aes(x=AGE, y=QSSTRESN)) + geom_point()

#Trying code from here: https://stackoverflow.com/questions/42147053/simulate-continuous-variable-that-is-correlated-to-existing-binary-variable

x1    <- qs2$AGE               # fixed given data

rho   <- 0.5                  # desired correlation = cos(angle)
theta <- acos(rho)             # corresponding angle
x2    <- runif(150, 4, 20)      # new random data
X     <- cbind(x1, x2)         # matrix
Xctr  <- scale(X, center=TRUE, scale=FALSE)   # centered columns (mean 0)

Id   <- diag(150)                             # identity matrix
Q    <- qr.Q(qr(Xctr[ , 1, drop=FALSE]))      # QR-decomposition, just matrix Q
P    <- tcrossprod(Q)          # = Q Q'       # projection onto space defined by x1
x2o  <- (Id-P) %*% Xctr[ , 2]                 # x2ctr made orthogonal to x1ctr
Xc2  <- cbind(Xctr[ , 1], x2o)                # bind to matrix
Y    <- Xc2 %*% diag(1/sqrt(colSums(Xc2^2)))  # scale columns to length 1

x <- Y[ , 2] + (1 / tan(theta)) * Y[ , 1]     # final new vector

qs2$score <- (1 + x) * 10

cor(qs2$AGE, qs2$score)

p <- ggplot(qs2, aes(x=AGE, y=score)) + geom_point()

write.csv(qs2 %>% rename(SCORE=score), "faux-containers/testdata_Canonical/QSMD.demo.csv");
