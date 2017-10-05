library(ggplot2)
twitter <- read.csv("~/Documents/NEU/2017Fall/IE7275/HW/HW1/M01_quasi_twitter.csv")
attach(twitter)

# a. How are the data distributed for friend_count variable?
par(mfrow = c(1, 1))
boxplot(friends_count, main = "Boxplot of friends_count", xlab = "friends_count")

# b. Compute the summery statistics (min, 1Q, mean, median, 3Q, max) on friend_count?
summary(friends_count)

# c. How are the data quality in friend_count variable? Interpret your answer
par(mfrow = c(1, 1))
hist(friends_count)
hist(log(friends_count))

# d. Produce a 3D scatter plot with highlighting to impression the depth for variables
# below on M01_quasi_twitter.csv dataset. created_at_year, education, age. Put the name
# of the scatter plot “3D scatter plot”.
library(scatterplot3d)
scatterplot3d(created_at_year, education, age, main = "3D scatter plot", highlight.3d = TRUE, type = "h", pch = 20)

# e. Consider 650, 1000,900,300 and 14900 tweeter accounts are in UK, Canada, India,
# Australia and US respectively. Plot the percentage Pie chart includes percentage
# amount and country name adjacent to it, and also plot 3D pie chart for those 
# countries along with the percentage pie chart. Hint: Use C=(1, 2) matrix form to
# plot the charts together.
par(mfrow = c(1, 2))
# Pencentile Pie Chart
slices <- c(650, 1000, 900, 300, 14900)
lbls <- c("UK", "Canada", "India", "Australia", "US")
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", pct, "%", sep = "")
pie(slices, labels = lbls2, col = rainbow(length(lbls2)), main = "Pie Char with Percentage")
# 3D Pie Chart
library(plotrix)
pie3D(slices, radius = 1.5, labelcex = 0.7, labels = lbls2, col = rainbow(length(lbls2)), main = "3D Pie Chart")

# f. Create kernel density plot of created_at_year variable and interpret the result.
par(mfrow=c(1,1))
d <- density(created_at_year)
plot(d, main = "Kernel Density of created_at_year")
polygon(d, col="red", border="blue")
rug(created_at_year, col="brown")


