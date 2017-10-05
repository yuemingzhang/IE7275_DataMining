library(ggplot2)
forestfires <- read.csv("~/Documents/NEU/2017Fall/IE7275/HW/HW1/forestfires.csv")
attach(forestfires)
str(forestfires)

month <- factor(month, levels = c("jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"))
day <- factor(day, levels = c("mon", "tue", "wed", "thu", "fri", "sat", "sun"))

# a. Plot area vs.temp, area vs. month, area vs. DC, area vs. RH for January through
# December combined in 1 graph. Hint: Place area on Y axis and use 2x2 matrix to 
# place the plots adjacent to each other.
par(mfrow = c(2, 2))
plot(temp, area, xlab = "temperature", ylab = "area", main = "area vs. temp")
plot(month, area, xlab = "month", ylab = "area", main = "area vs. month")
plot(DC, area, xlab = "DC index", ylab = "area", main = "area vs. DC")
plot(RH, area, xlab = "Relative humidity", ylab = "area", main = "area vs. RH")

# b. Plot the histogram of wind speed (km/h) from January through December.
par(mfrow = c(1, 1))
hist(wind, col = "light blue")

# c. Compute the summary statistics (min, 1Q, mean, median, 3Q, max,) of part b.
summary(wind)

# d. Add a density line to the histogram in part b.
hist(wind, col = "light blue", freq=FALSE)
lines(density(wind), col="blue", lwd=2)

# e. Plot the density function of months. Use different colors in the graph to 
# interpret your result clearly.
par(mfrow = c(1, 1))
qplot(wind, geom = "density", xlab = "wind", color = month)

# f. Plot the scatter matrix for temp, RH, DC and DMC. How you can interpret the 
# result in terms of correlation among these data.
library(gclus)
mydata <- forestfires[c("temp", "RH", "DC", "DMC")]
mydata.corr <- abs(cor(mydata))
myorder <- order.single(mydata.corr)
mycolors <- dmat.color(mydata.corr)
cpairs(mydata, myorder, panel.colors = mycolors, gap=.5, main="Variables Ordered and Colored by Correlation")

# g. Create boxplot for wind, ISI and DC. Are there anomalies/outliers. Interpret 
# your result.
par(mfrow = c(1, 3))
boxplot(wind, main = "Boxplot of wind", xlab = "Wind")
boxplot(ISI, main = "Boxplot of ISI", xlab = "ISI")
boxplot(DC, main = "Boxplot of DC", xlab = "DC")

# h. Create the histogram of DMC. Create the histogram of log of DMC. Compare the 
# result and explain your answer.
par(mfrow = c(1, 2))
hist(DMC)
hist(log(DMC))

par(mfrow = c(1, 1))
hist(sqrt(DMC))
