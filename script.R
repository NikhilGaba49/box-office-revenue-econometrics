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