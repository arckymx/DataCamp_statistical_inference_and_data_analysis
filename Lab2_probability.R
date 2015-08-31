# DataCamp
# Data Analysis and Statistical Inference
# lab 2 
# Probability

# The goals for this lab are to (1) think about the effects of independent and dependent events, 
# (2) learn how to simulate shooting streaks in R, and 
# (3) to compare a simulation to actual data in order to determine if the hot hand phenomenon appears to be real.




# Getting started

# Instructions
# Use the function load() function with the url() function to load the data frame from 
# http://assets.datacamp.com/course/dasi/kobe.RData.
load(url('http://assets.datacamp.com/course/dasi/kobe.RData'))

# Take a peek at the data (it's called kobe) using the head() and/or tail() function.
head(kobe)
tail(kobe)




# Kobe's track record

Instructions

# Take a look at the names of the variables in kobe. (The data frame is already loaded.)
names(kobe)

# Verify Kobe's hit/miss track record by printing the first nine observations in the basket variable. 
# Compare the output to the sequence shown: H M | M | H H M | M | M | M.
kobe$basket[1:9]

# Comment: yes they are the same




# Question 1
# Definition: the length of a shooting streak is the number of consecutive baskets (hits) until a miss occurs.
# What does a streak length of 1 mean, i.e. how many hits and misses are in a streak of 1?

# Answer: A hit followed by a miss.



# Question 2
# What about a streak length of 0? How many hits and misses are in a streak of 0?

# Answer: A miss followed by a miss.




# A first analysis

# Let's look at the distribution of the shooting streaks.
# Along with the data frame, we also loaded the custom function calc_streak() into the workspace.

# We'll use this function to calculate the lengths of all shooting streaks 
# and then look at the distribution with a barplot. 
# Note that a bar plot is preferable to a histogram here since our variable is discrete 
# (we're dealing with counts) instead of continuous.

# Instructions

# Use the function calc_streak() to calculate the length of Kobe's streaks (by using the variable basket) and assign the result to kobe_streak.
kobe_streak <- calc_streak(kobe$basket)

# Add a table to make it neat
table(kobe_streak)

# Draw a barplot of kobe_streak.
barplot(table(kobe_streak),
        main = "Count of Kobe's Streak",
        col = "orange"
)





# Question 3

# Which of the following is false about the distribution of Kobe's streak lengths from the 2009 NBA finals?
# Hint: You may also want to use other visualizations and summaries of kobe streak in order to answer this question.

# Answer: The distribution of Kobe's streaks is unimodal and left skewed.




# Question 4

# let's return to the idea of independence. 
# Two processes are independent if the outcome of one process doesn't effect the outcome of the second. 
# If each shot that a player takes is an independent process, 
# having made or missed your first shot will not affect the probability that you will make or miss your second shot.

# A shooter with a hot hand will have shots that are not independent of one another. 
# Specifically, if the shooter makes his first shot, 
# the hot hand model says he will have a higher probability of making his second shot. 
# Let's suppose for a moment that the hot hand model is valid for Kobe. During his career, 
# the percentage of time Kobe makes a basket (i.e. his shooting percentage) is about 45%, 
# or in probability notation:

# P(shot1=H) = 0.45

# If Kobe has a hot hand (not independent shots), 
# then the probability that he makes his second shot would go up given that he made the first shot:

# P(shot2=H | shot1=H) > 0.45

# Is this statement true?
# Answer: Yes




# Question 5

# Compare this to the skeptical perspective where Kobe does not have a hot hand, where each shot is independent of the next.
# If he hits his first shot, the probability that he makes the second is still 0.45:

# P(shot2=H | shot1=H)=0.45

# Let's return to the question: how do we tell if Kobe's shooting streaks are long enough to indicate that he has hot hands? 
# We can compare his streak lengths to someone without hot hands: an independent shooter. 
# Starting with the next exercise, you'll learn how to simulate such an independent shooter in R.

# If Kobe's shooting streaks diverge significantly from an independent shooter's streaks, we can conclude.

# Answer: We can conclude that Kobe likely has a hot hand.




# Simulations in R

# In a simulation, 
# you set the ground rules of a random process and then the computer uses random numbers to generate an outcome,
# that adheres to those rules. 
# As a simple example, you can simulate flipping a fair coin with the following commands.

outcomes <- c("heads", "tails")
sample(outcomes, size=1, replace=TRUE) 

# The vector outcomes can be thought of as a hat with two slips of paper in it: 
# one slip says "heads" and the other says "tails". 
# The function sample() draws one slip from the hat and tells us if it was a head or a tail.


# Instructions
# Run the second command listed above several times. 
# Just like when flipping a coin, sometimes you'll get a head, 
# sometimes you'll get a tail, 
# but in the long run, you'd expect to get roughly equal numbers of each.
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)
sample(outcomes, size=1, replace=TRUE)




# Flipping 100 coins
# Adjust the size argument, which governs how many samples to draw. 
size

# The replace = TRUE argument indicates we put the chip back in the hat before drawing again, 
# therefore always keeping the 50/50 odds.
replace = TRUE
Instructions


# Instructions
# Simulate flipping a fair coin 100 times with the sample() function by setting the size to 100. Assign the result to sim_fair_coin.
sim_fair_coin <- sample(outcomes, size=100, replace=TRUE)

# Inspect the results by printing the object and using the table() function to count the amounts of heads and tails.
table(sim_fair_coin)




# Flipping an unfair coin

# Run 100 simulations of an unfair coin that lands on head 20% of the time. 
# Do this by assigning assign the result to sim_unfair_coin. 
# (If you need help, look at the documentation by typing ?sample in the console.)
sim_unfair_coin <- sample(outcomes, size=100, replace=TRUE, prob = c(0.2,0.8))

# Inspect the result using the table() function.
table(sim_unfair_coin)



# Question 6

# How many heads would you expect to come up after flipping this unfair coin 100 times?
# Answer: 20



# Simulating the Independent Shooter

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, 
                     size = 1, 
                     replace = TRUE)



# Instructions
# Run a simulation to sample 133 shots (the number of shots of Kobe in this data set) with a shooting percentage of 45%. 
# Assign the output of this simulation to a new object called sim_basket

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, 
                     size = 133, 
                     replace = TRUE,
                     prob = c(0.45,0.55)
                     )



# Kobe vs. the Independent Shooter

# Instructions

# Using the custom function calc_streak(), compute the streak lengths of kobe$basket and sim_basket. 
# Assign the results to kobe_streak and sim_streak relatively.
kobe_streak <- calc_streak(kobe$basket)
sim_streak <- calc_streak(sim_basket)

# Compare them using the techniques you've learned: simply printing the streaks, 
# summarizing using summary, and drawing barplots. 
summary(kobe_streak)
summary(sim_streak)

# To create the barplots, make sure to first build the tables kobe_table and sim_table
# from kobe_streak and sim_streak respectively.
tkobe <- table(kobe_streak)
tsim <- table(sim_streak)
barplot(tkobe)
barplot(tsim)

t.test(kobe_streak,sim_streak)




# Question 7
# If you were to run the simulation of the independent shooter a second time,
# how would you expect its streak distribution to compare to the distribution from the question above?

# Answer: A somewhat similar distribution




# Question 8
# How does Kobe Bryant's distribution of streak lengths compare to the distribution of 
# streak lengths for the simulated shooter?

# Answer: They are fairly similar to each other.



# Question 9
# Since Kobe's streak length distribution looks very similar to the independent shooter's 
# simulated steak length distribution, we can conclude that Kobe Bryant likely does not have a "hot hand".

# Answer: True

