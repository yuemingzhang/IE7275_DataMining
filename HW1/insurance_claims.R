library(ggplot2)
data <- read.csv("~/Documents/NEU/2017Fall/IE7275/HW/HW1/raw_data.csv")

# a. Normalize the data and create new dataset with normalized data and name it Ndata.
Ndata <- scale(data, center=TRUE, scale=TRUE)
Ndata <- as.data.frame(Ndata)

# b. Create the boxplot of all the variables in their original form.
boxplot(data, main = "Boxplot of original data")

# c. Create boxplot of all the variables in their normalized form.
boxplot(Ndata, main = "Boxplot of normalized data")

# d. Compare the result of part b and part c; interpret your answer.

# e. Prepare scatter plot of variables A and B. How correlated the data are in these
# variables. Interpret your answer.
library(car)
scatterplot(Ndata$A~Ndata$B, main = "Scatterplot of A(Sustainability) and B(Carbon footprint)", xlab = "B(Carbon footprint)", ylab = "A(Sustainability)")
