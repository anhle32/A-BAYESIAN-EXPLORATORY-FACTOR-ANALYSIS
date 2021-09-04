set.seed(6)
setwd("C:/Users/DELL/Desktop/bayes EFA")
datase=read.csv("dataBEFA.csv", header=TRUE)
head(datase,10)
install.packages('corrplot')
library(corrplot)
corrplot(cor(datase, use="complete.obs"), order = "original", tl.col='black', tl.cex=.75) 
library(befa)
data1<-data.frame(scale(datase, center = TRUE,scale = TRUE))
mcmc <- befa(model = data1, Kmax = 7, burnin=2500, iter = 25000)
mcmc <- post.column.switch(mcmc)
mcmc <- post.sign.switch(mcmc)
da<-summary(mcmc)
library(writexl)
write_xlsx(as.data.frame(da$nfac),path="t1.xlsx")
sink("output.csv")
print(summary(mcmc))
sink()
plot(mcmc)
summary(mcmc)


install.packages("psych")
install.packages("GPArotation")




