# short.dat = as.matrix(read.delim("~/work/stat571/hw02/3.23.dat", header=F))
# library(reshape2)
# help(reshape2)

dat = read.delim("~/work/stat571/hw02/3.23.long.dat")
dat$fluid = factor(dat$fluid) # to turn integers into factors
# summary(dat)

# a
amod = aov(life ~ fluid, data=dat)
amod.sum = unlist(summary(amod))
amod.sum['Pr(>F)1']

tuk = TukeyHSD(amod, conf.level=0.95)
plot(tuk)

# b
plot(life ~ fluid, data=dat)
boxplot(life ~ fluid, data=dat, ylab = "Life", xlab = "Fluid")

# c
lmod = lm(life ~ fluid, data=dat)
plot(lmod)
plot(residuals(lmod), main="Residuals life ~ fluid")
abline(0,0)

hist(lm.res)
plot(lm.res)
qqnorm(lm.res)
qqline(lm.res)
