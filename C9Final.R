# Developing Data Product
library(UsingR)
data("diamond")
data_set = diamond
fit_reg = lm(price ~ carat, data = data_set)

plot(data_set, pch = 16, col="blue", 
     ylab = "Price in Singapore dollars", 
     xlab = "Size of Diamond in Carat") + 
    abline(fit_reg, lwd =2, col="red")

library(rsconnect)
rsconnect::setAccountInfo(name='rfpfi8-snehangshu-roy',
                          token='01BA5FB052A921625F027E2A5E947D9E',
                          secret='<SECRET>')