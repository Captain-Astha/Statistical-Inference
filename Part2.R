library(datasets)
library(ggplot2)
str(ToothGrowth)
summary(ToothGrowth)
data <- ToothGrowth
levels(data$supp) <- c("Orange Juice", "Ascorbic Acid")
g <- ggplot(data, aes(x = factor(dose), y = len))
g <- g + facet_grid(.~supp)
g <- g + geom_boxplot(aes(fill = supp))
g <- g + labs(title = "Tooth Length by Dosage for Every Supplement")
g <- g + labs(x = "Dose (mg/day)", y = "Tooth Length")
print(g)
h0.5 <- t.test(len ~ supp, data = subset(data, dose == 0.5))
h0.5$conf.int
h0.5$p.value
h1 <- t.test(len ~ supp, data = subset(data, dose == 1))
h1$conf.int
h1$p.value
h2 <- t.test(len ~ supp, data = subset(data, dose == 2))
h2$conf.int
h2$p.value