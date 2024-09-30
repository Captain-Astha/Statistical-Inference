---
  title: "Statistical Inference part 1"
author: "Astha"
date: "2024-09-30"
output:
  pdf_document: default
html_document: default
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


### Overview
This analysis aims to explore the exponential distribution and compare it to the Central Limit Theorem. The parameter (lambda) will be fixed at 0.2 for all simulations. We will examine the distribution of averages derived from 40 exponential random variables.


set.seed(143)
lambda <- 0.2
nexp <- 40

average <- NULL
for(i in 1:1000)
  average <- c(average, mean(rexp(nexp, lambda)))
lambda ^ -1
mean(average)
(lambda * sqrt(nexp)) ^ -2
var(average)
library(ggplot2)
g <- ggplot(data.frame(column = average), aes(x = column))
g <- g + geom_histogram(aes(y = after_stat(density)), binwidth = 0.2, fill = 'pink', color = 'black')
g <- g + stat_function(fun = dnorm, args = list(mean = lambda^-1, sd=(lambda*sqrt(nexp))^-1), size=2)
g <- g + labs(title = "Distribution of Exponentials", x = "Simulation Means", y = "Density")
g