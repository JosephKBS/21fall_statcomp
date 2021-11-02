# Week 8

# ---------------------------------
# 1. density plot
# ---------------------------------
plot(density(household$Dollars), xlab = "U.S. Dollars", main = " ")

rural.households <- household$Dollars[household$Area == "Rural"]
urban.households <- household$Dollars[household$Area == "Urban"]

# plot density curve for the rural households
d.rural <- density(rural.households)
plot(d.rural, main = " ", xlab = "Household Per Capita Expenditures (in U.S. Dollars)", lty = "solid", bty = "l")

# add density curve for the urban households
d.urban <- density(urban.households)
lines(d.urban, lty = "dotted")

# ---------------------------------
# 2. numerical summary
# ---------------------------------
tapply(X = household$Dollars, INDEX = household$Area, FUN = mean)
# variance for the household per capita expenditire conditioned on area 
tapply(X = household$Dollars, INDEX = household$Area, FUN = var)
# standard deviation for the household per capita expenditire conditioned on area 
tapply(X = household$Dollars, INDEX = household$Area, FUN = sd)


# standard deviations
numerator <- tapply(X = household$Dollars, INDEX = household$Area, FUN = sd)
# square root of sample sizes
denominator <- sqrt(table(household$Area))
# standard errors
numerator / denominator

# load e1071 package
library(e1071)
# skewness measure for the marginal distribution of household per capita expenditure
skewness(household$Dollars, type = 2)
# skewness measure for the distribution of household per capita expenditure conditioned on area
tapply(X = household$Dollars, INDEX = household$Area, FUN = skewness, type = 2)
# Kurtosis measure for the marginal distribution of household per capita expenditure
kurtosis(household$Dollars, type = 2)
# Kurtosis for the distribution of household per capita expenditure conditioned on area
tapply(X = household$Dollars, INDEX = household$Area, FUN = kurtosis, type = 2)


 ---------------------------------
# 3. Robust estimation
# ---------------------------------

# marginal 20% trimmed mean
mean(household$Dollars, tr = 0.2)
# conditional 20% trimmed means
tapply(X = household$Dollars, INDEX = household$Area, FUN = mean, tr=.2)
# marginal median
median(household$Dollars)
# conditional medians
tapply(X = household$Dollars, INDEX = household$Area, FUN = median)

# load the WRS package
library(WRS2)
# marginal 20% Winsorized variance
winvar(household$Dollars, tr = 0.2)
# conditional 20% Winsorized variances
tapply(X = household$Dollars, INDEX = household$Area, FUN = winvar, tr=.2)
# conditional 20% Winsorized standard deviation for the rural households
sqrt(tapply(X = household$Dollars, INDEX = household$Area, FUN = winvar, tr=.2))




