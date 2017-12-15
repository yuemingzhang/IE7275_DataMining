"women" <-
data.frame(height = c(58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
70, 71, 72), weight = c(115, 117, 120, 123, 126, 129, 132, 135, 139, 142,
146, 150, 154, 159, 164))

fit <- lm(weight ~ height, data = women)
par(mfrow = c(2, 2))
plot(fit)

fit2 <- lm(weight ~ height + I(height^2), data = women)
par(mfrow = c(2, 2))
plot(fit2)

newfit <- lm(weight ~ height + I(height^2), data = women[-c(13, 15),])
par(mfrow = c(2, 2))
plot(newfit)
