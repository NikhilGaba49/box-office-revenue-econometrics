setwd("C:/Users/Nikhil Gaba/Documents/Internship/GitHub Repositories/box-office-revenue-econometrics/code_with_dataset")

# First,  we need to load the data and packages.
library(stargazer)
data=read.csv(file="movie_data.csv")


# Summary statistics for number of observations, mean, standard deviation, median, and the interquartile range
stargazer(data, 
          summary.stat = c("n", "mean", "sd", "median", "p25", "p75"),  
          type="text", title="Descriptive Statistics",
          out="sumstats.txt")

# We want to compute the 95% confidence intervals for the mean.

# Confidence interval for box_office_revenue, using formulas as taught in lectures
box_office_revenue_standard_error = sd(data$box_office_revenue)/sqrt(length(data$box_office_revenue))
lower_bound_box_office_revenue=mean(data$box_office_revenue)-qnorm(0.975)*box_office_revenue_standard_error
upper_bound_box_office_revenue=mean(data$box_office_revenue)+qnorm(0.975)*box_office_revenue_standard_error
conf_int_box_office_revenue=c(lower_bound_box_office_revenue,upper_bound_box_office_revenue)
conf_int_box_office_revenue

# Confidence interval for movie_budget, using formulas as taught in lectures
budget_standard_error = sd(data$movie_budget)/sqrt(length(data$movie_budget))
lower_bound_budget=mean(data$movie_budget)-qnorm(0.975)*budget_standard_error
upper_bound_budget=mean(data$movie_budget)+qnorm(0.975)*budget_standard_error
conf_int_movie_budget=c(lower_bound_budget,upper_bound_budget) 
conf_int_movie_budget

# Confidence interval for audience_score, using formulas as taught in lectures 
score_standard_error = sd(data$audience_score)/sqrt(length(data$audience_score))
lower_bound_score=mean(data$audience_score)-qnorm(0.975)*score_standard_error
upper_bound_score=mean(data$audience_score)+qnorm(0.975)*score_standard_error
conf_int_audience_score=c(lower_bound_score,upper_bound_score)
conf_int_audience_score

# Plotting the density function
plot(density(data$box_office_revenue), main = "Density Function for Box Office Revenue", xlab = "Box Office Revenue ($m)")

# High Budget Variable
which_high_budget=which(data$movie_budget >= median(data$movie_budget)) # filter rows which are high budget
high_budget=numeric(length(data$movie_budget)) # create a numeric vector of the same length
high_budget[which_high_budget] = 1 # assign 1 to the high budget films 
high_budget

# Plot the densities.
jpeg("high_budget_vs_low_budget.jpg")
plot(density(data$box_office_revenue[high_budget==0]), col="blue",lty=1,
     xlab="Box Office Revenue", ylab="Density",
     main="Density Functions of High Budget vs Low Budget Movies")
lines(density(data$box_office_revenue[high_budget==1]), col="red",lty=2)
legend("topright", legend=c("Low Budget", "High Budget"), col=c("blue","red"), lty=c(1,2))

dev.off() 

# Performing a hypothesis test on if the difference in means is 0 for high budget vs low budget.
t.test(data$box_office_revenue[high_budget==1],data$box_office_revenue[high_budget==0]) 

# Regression Line First
revenue_budget_reg=lm(box_office_revenue~movie_budget, data=data)

# Plotting a scatterplot and a regression line for revenue and movie budget.
jpeg("revenue_vs_budget.jpg")
plot(data$movie_budget,data$box_office_revenue, main = "Box Office Revenue vs Movie Budget", xlab = "Movie Budget ($m)", ylab = "Box Office Revenue ($m)") 
abline(revenue_budget_reg)
dev.off()

# First Regression revenue vs budget is already defined
revenue_budget_reg
# Second Regression revenue vs audience score.
revenue_score_reg=lm(box_office_revenue~audience_score, data=data)
revenue_score_reg

#Test whether or not the the slopes of each regression line is 0 at the 5% level of significance.
summary(revenue_budget_reg)
summary(revenue_score_reg)