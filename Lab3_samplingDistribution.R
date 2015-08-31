# DataCamp
# Data Analysis and Statistical Inference
# lab 3
# Foundations for Inference: Sampling Distribution



# Sampling distributions

# We're interested in formulating a sampling distribution of our estimate 
# in order to learn about the properties of the estimate, such as its distribution.

# We consider real estate data from the city of Ames, Iowa. 
# The details of every real estate transaction in Ames is recorded by the City Assessor's office. 
# Our particular focus for this lab will be all residential home sales in Ames between 2006 and 2010. 
# This collection represents our population of interest (which is rare to have access to), 
# but we will also work with smaller samples from this population.


# Instructions

# Start by loading the data: 
load(url("http://assets.datacamp.com/course/dasi/ames.RData"))

# The RData-file contains the data frame ames. 
# After loading the data, have a look at your data frame using the techniques you learned.
head(ames)
names(ames)
summary(ames)
str(ames)




# A first distribution analysis

# Instructions
# Create two objects 'area' and 'price' and assign to them the two variables 
# (Gr.Liv.Area and SalePrice) 
# we picked from our data frame.
area <- ames$Gr.Liv.Area
price <- ames$SalePrice

# Take a look at the distribution of area in the population of home sales by calculating the summary()
# and drawing a histogram of area
summary(area)
summary(price)

hist(area,
     main = 'Histogram of Gr.Liv.Area'
     )

hist(price,
     main = 'Histogram of salesPrice'
     )

  


# Question 1 
# Which of the following is false?

# The distribution of areas of houses in Ames is unimodal and right-skewed.
# 250% of houses in Ames are smaller than 1,500 square feet.
# 3The middle 50% of the houses range between approximately 1,130 square feet and 1,740 square feet.
# 4The IQR is approximately 610 square feet.
# 5The smallest house is 334 square feet and the largest is 5,642 square feet.

# Answer: 50% of houses in Ames are smaller than 1,500 square feet.




# Sampling from the population

# Instructions

# Take a sample of 50 of the area and assign it to samp0.
samp0 <- sample(area, size = 50)

# Take another sample of 50 and assign it to samp1.
samp1 <- sample(area,size = 50)

# Compare these two samples by drawing histograms. 
hist(samp0)
hist(samp1)


# Think about how their distribution compares to the complete population.
# Comment: a little different




# Question 2

# If we're interested in estimating the average living area of homes in Ames using the sample, 
# our best single guess is the sample mean
mean(samp1)
mean(samp0)

# Depending on which 50 homes you selected, 
# your estimate could be a bit above or a bit below the true population mean of approximately 1,500 square feet.
# In general, though, the sample mean turns out to be a pretty good estimate of the average living area, 
# and we were able to get it by sampling less than 3% of the population.

# Suppose we took two more samples, one of size 100 and one of size 1000. 
# Which would you think would provide a more accurate estimate of the population mean?
mean(sample(area,size = 100))
mean(sample(area,size = 1000))

# Answer: sample size of 1000, 
# Yes! The bigger the sample set, 
# the more representative of the complete population, and thus the higher its accuracy.



# The sampling distribution
# Not surprisingly, every time we take another random sample, we get a different sample mean. 
# It's useful to get a sense of just how much variability we should expect when estimating the population mean this way.

# The distribution of sample means, called the sampling distribution, can help us understand this variability.
# Here we will generate 5000 samples and compute the sample mean of each.

# The code beow takes 5000 samples of size 50 from the population, calculates the mean of each sample, 
# and stores each result in a vector called sample_means50, using what we call a for loop.

# Set up an empty vector of 5000 NAs to store sample means:
sample_means50 <- rep(NA, 5000)

# Take 5000 samples of size 50 of 'area' and store all of them in 'sample_means50'.
for (i in 1:5000) {
  samp <- sample(area, 50)
  sample_means50[i] <- mean(samp)
}

# View the result. If you want, you can increase the bin width to show more detail by changing the 'breaks' argument.
hist(sample_means50, breaks = 13)




# Interlude: The for loop

# You have just run your first for loop, a cornerstone of computer programming. 
# The idea behind the for loop is iteration: 
# it allows you to execute code as many times as you want without having to type out every iteration.


# Interlude: Breaking it down

# First line - we initialize a vector. In this case, we created a vector of 5000 NAs called sample means50. 
# This vector will store values generated within the for loop. NA means not available, 
# and in this case they're used as placeholders until we fill in the values with actual sample means. 
# NA is also often used for missing data in R.


# second line calls the for loop itself. 
# The syntax can be loosely read as, “for every element i from 1 to 5000, run the following lines of code”. 
# You can think of i as the counter that keeps track of which loop you're on. 
# Therefore, more precisely, the loop will run once when i=1, then once when i=2, and so on up to i=5000.


# The body of the for loop is the part inside the curly braces, 
# and this set of code is run for each value of i. 
# Here, on every loop, we take a random sample of size 50 from area, 
# take its mean, and store it as the ith element of sample_means50. 
# In order to display that this is really happening, we asked R to print i at each iteration. 
# This line of code is optional and is only used for displaying what's going on while the for loop is running.


# The vector 'sample_means50' is initialized with NA values
sample_means50 <- rep(NA, 5000)
# The for loop runs 5000 times, with 'i' taking values 1 up to 5000
for (i in 1:5000) {
  # Take a random sample of size 50
  samp <- sample(area, 50)
  # Store the mean of the sample in the 'sample_means50' vector on the ith place
  sample_means50[i] <- mean(samp)
  # Print the counter 'i'
  print(i)
}

# Print the first few random means
head(sample_means50)




# Your first for loop

# Instructions

# Initialize a vector of 100 NAs called sample_means_small.
sample_means_small <- rep(NA, 100)

# Run a loop for 100 times that takes a sample of size 50 from area and stores the sample mean in sample_means_small.
for (i in 1:100) {
  samp <- sample(area, 50)
  sample_means_small[i] <- mean (samp)
}




# Question 3
# How many elements are there in this object called sample_means_small?
# Answer: 100




# Question 4
# Which of the following is true about the elements in the sampling distributions you created? 
# (The elements in sample_means_small.)
# Answer: Each element represents a mean square footage from a simple random sample of 50 houses.




# More on sampling

# Mechanics aside, let's return to the reason we used a for loop: to compute a sampling distribution, 
# specifically, this one: 
hist(sample_means50)


# The sampling distribution that we computed tells us much about estimating the average living area in homes in Ames. 
# Because the sample mean is an unbiased estimator, 
# the sampling distribution is centered at the true average living area of the the population, 
# and the spread of the distribution indicates how much variability is induced by sampling only 50 home sales.

# Initialize the sample distributions:
sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)

# Run the for loop:
for (i in 1:5000) {
  samp <- sample(area, 10)
  sample_means10[i] <- mean(samp)
  samp <- sample(area, 100)
  sample_means100[i] <- mean(samp)
}




# Influence of sample size

# To see the effect that different sample sizes have on the sampling distribution, 
# let's plot the three distributions on top of one another.

# In R you can plot all three of them on the same graph by specifying that 
# you'd like to divide the plotting area into three rows and one column of plots. 
# You do this with the following command:
par(mfrow = c(3, 1))

# For easy comparison, we'd also like to use the same scale for each histogram. 
# As a common scale, we'll use to the limits (min, max) of the first sample distribution:
xlimits <- range(sample_means10)


# Instructions
# To help you get started we've already divided the plotting area and initialized the xlimits.
# Use the hist() function three times to draw the sample distributions sample_means10, sample_means50 and sample_means100.
# Set the breaks argument of each of the histograms to 20.
# Set the xlim argument of each of the histograms to xlimits.

# Divide the plot in 3 rows:
par(mfrow = c(3, 1))

# Define the limits for the x-axis:
xlimits <- range(sample_means10)

# Draw the histograms:
hist(sample_means10,
     xlim = xlimits,
     breaks = 20
)

hist(sample_means50, 
     xlim = xlimits,
     breaks = 20
)

hist(sample_means100, 
     xlim = xlimits,
     breaks = 20
)




# Question 5
# It makes intuitive sense that as the sample size increases, 
# the center of the sampling distribution becomes a more reliable estimate for the true population mean. 
# Also as the sample size increases, the variability of the sampling distribution _________.
# Answer: decreases




# Now: prices!

# Instructions

# To start, just take a random sample of size 50 from price and assign it to sample_50.
sample_50 <- sample(price, 50)

# Print its mean.
mean(sample_50)




# Sampling distribution of prices

# And now the real challenge: running a loop.
# Since you have access to the population, we can simulate the sampling distribution for x-bar
# by taking 5000 samples of size 50 from the population and compute 5000 sample means.


# Instructions

# Initialize an object sample_means50 with 5000 NAs.
sample_means50 <- rep(NA, 5000)

# Use a for loop to create 5000 samples of size 50 of price.
# Inside the loop, calculate the mean of each sample and assign it to its place in sample_means50.
for (i in 1:5000) {
  samp <- sample(price, 50)
  sample_means50[i] <- mean(samp)
}

# Inspect the result by printing sample_means50 using the head() function.
head(sample_means50)

# Based on this sampling distribution, think about what the mean home price of the population will be?
summary(price)
summary(sample_means50)




# More on sampling distribution of prices

# Instructions

# Create sample_means150 and populate it with the means of 5000 samples of size 150.
sample_means150 <- rep(NA, 5000)

for (i in 1:5000) {
  samp <- sample(price, 150)
  sample_means150[i] <- mean(samp)
}


# Finish with drawing histograms of both sample_means50 and sample_means150.

par(mfrow = c(2, 1))
xlimits <- range(sample_means150)
hist(sample_means50)
hist(sample_means150)

summary(sample_means50)
summary(sample_means50)




# Question 6
# Which of the following is false?

# (1) The variability of the sampling distribution with the smaller sample size (sample_means50) is smaller than the variability of the sampling distribution with the larger sample size (sample_means150).
# (2) The means for the two sampling distributions are roughly similar.
# (3) The sampling distributions are symmetric.

# Answer: (1)

