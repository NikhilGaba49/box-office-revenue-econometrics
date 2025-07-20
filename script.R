# First,  we need to load the data and packages.
library(stargazer)
data=read.csv(file="movie_data.csv")


# Summary statistics for number of observations, mean, standard deviation, median, and the interquartile range
stargazer(data, 
          summary.stat = c("n", "mean", "sd", "median", "p25", "p75"),  
          type="text", title="Descriptive Statistics",
          out="sumstats.txt")
