# DataCamp
# Data Analysis and Statistical Inference
# lab 3b
# Foundations for Inference: Confidence Intervals



# One sample from Ames, Iowa

# confidence intervals.
# If you have access to data on an entire population, say the size of every house in Ames, Iowa, 
# it's straight forward to answer questions like, "How big is the typical house in Ames?" 
# and "How much variation is there in sizes of houses?". 
# If you have access to only a sample of the population, as is often the case, the task becomes more complicated

# What is your best guess for the typical size if you only know the sizes of several dozen houses? 
# This sort of situation requires that you use your sample to make inference on what your population looks like.

# Instructions

# Start by loading the data: 
load(url("http://assets.datacamp.com/course/dasi/ames.RData"))

# Take a sample of size 60 of the population:
population <- ames$Gr.Liv.Area
samp <- sample(population, size = 60)

# Calculate the mean:
sample_mean <- mean(samp)

# Draw a histogram:
hist(samp)




# Question 7
# Your distribution should be similar to others' distributions who also collect random samples from this population, 
# but it is likely not exactly the same since it's a random sample.

# Answer: TRUE




# Confidence Intervals

# We can calculate a 95% confidence interval 
# for a sample mean by adding and subtracting 1.96 standard errors to the point estimate.

# Instructions

# Calculate the standard error:
se <- sd(samp)/sqrt(60)

# Calculate the lower and upper bounds of your confidence interval and print them:
lower <- sample_mean - 1.96 * se
upper <- sample_mean + 1.96 * se
c(lower, upper)




# Question 8
# For the confidence interval to be valid, the sample mean must be normally distributed and have standard error
# Which of the following is not a condition needed for this to be true?

# A. The sample is random.
# B. The sample size, 60, is less than 10% of all houses.
# C. The sample distribution must be nearly normal.

# Answer: C. The sample distribution must be nearly normal.




# Question 9
# What does "95% confidence" mean?

# Answer: 95% of random samples of size 60 will yield confidence intervals that contain the true average area of houses in Ames, Iowa.




# Question 10
# In this case you have the luxury of knowing the true population mean since we have data on the entire population. 
# This value can be calculated using the following command: mean(population).

# What proportion of 95% confidence intervals would you expect to capture the true population mean?

# Answer: 95%




# Challenge (1)

# Using R, we're going to recreate many samples using a for loop. 

# Here is the rough outline:

# Obtain a random sample.
# Calculate the sample's mean and standard deviation.
# Use these statistics to calculate a confidence interval.
# Repeat steps (1)-(3) 50 times.

# But let's start slowly by initializing the objects you'll use to store the means and standard deviations. 
# We'll also store the desired sample size as n.

Instructions
# Initialize samp_mean and samp_sd with 50 NA values. (Use the rep() function.)
samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)

# Set n to 60.
n <- 60




# Challenge (2)

# Instructions

# Use a for loop to do 50 times the following:
# create a sample of size n from the population (call this samp).

# Calculate the mean and sd and assign them to their correct positions in samp_mean and 
# samp_sd depending on which iteration you're on.

# For loop goes here:
for (i in 1:50) {
  samp <- sample(population, n)
  samp_mean[i] <- mean(samp)
  samp_sd[i] <- sd(samp)
}




# Challenge (3)

# Lastly, we can construct the confidence intervals and plot them.
# In this exercise, you will have to calculate the 95% confidence intervals.

# Instructions

# Calculate the interval bounds here:
lower <- samp_mean - 1.96 * samp_sd/sqrt(n)
upper <- samp_mean + 1.96 * samp_sd/sqrt(n)
  
# Plotting the confidence intervals:
pop_mean <- mean(population)
plot_ci(lower, upper, pop_mean)




# Question 11
# What is the appropriate critical value for a 99% confidence level?

# Answer: 2.58




# The 99%

# Calculate 50 confidence intervals at the 99% confidence level. 

# Adjusting the formula
lower <- samp_mean - 2.58 * samp_sd/sqrt(n)
upper <- samp_mean + 2.58 * samp_sd/sqrt(n)




# Question 12

# We would expect 99% of the intervals to contain the true population mean.

# Answer: TRUE



