# DataCamp
# Data Analysis and Statistical Inference
# lab 1   

# Load the cdc data frame into the workspace
load(url('http://assets.datacamp.com/course/dasi/cdc.Rdata'))




# Which variables are you working with?

# Print the names of the variables: 
names(cdc)

# 'genhlth', respondents were asked to evaluate their general health from excellent down to poor. 
# 'exerany' variable indicates whether the respondent exercised in the past month (1) or did not (0). Likewise, hlthplan indicates whether the respondent had some form of health coverage. 
# 'smoke100' variable indicates whether the respondent had smoked at least 100 cigarettes in his lifetime.




# Taking a peek at your data

# Print the head and tails of the data frame:
head(cdc)
tail(cdc)



# Question 1

# How many cases and how many variables are there in the cdc data set? 
# This data set is available in the workspace; you can inspect it by executing cdc in the console on the right.
str(cdc)

# Answer: 20,000 obs, 9 variables




# Question 2

# What type of variable is 'genhlth'?

# Check the variable
head(cdc$genhlth)

# [1] good      good      good      good      very good very good

# Answer: categorical, ordinal




# Question 3

# What type of variable is 'weight'?

# Check the variable 
head(cdc$weight)

# Answer: numerical, continuous


# Question 4

# What type of variable is 'smoke100'?

# Check the variable 
head(cdc$smoke100)

# Answer: categorical (not ordinal)




# Turning info into knowledge - Numerical data

# You can use functions mean, var and median 
# to calculate the (surprise, surprise) mean, variance and median 
# of certain variables of your data frame.
mean()
var()
median()

# The function summary() returns a numerical summary: minimum, first quartile, median, mean, third quartile, and maximum.
summary()


# Instructions
# Calculate the mean, var and median of the weight variable of your data frame. 
# (Just print it, no need to assign objects.)

mean(cdc$weight)    # Answer: [1] 169.683
var(cdc$weight)     # Answer: [1] 1606.484
median(cdc$weight)  # Answer: [1] 165
summary(cdc$weight) 

# Answer: 
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 68.0   140.0   165.0   169.7   190.0   500.0




# Turning info into knowledge - Categorical data

# The function table() counts the number of times each kind of category occurs in a variable. 
# For example, to see the number of people who have smoked at least 100 cigarettes in their lifetime, 
# try table(cdc$smoke100) in the console.

# You can also get the relative frequencies by dividing the table by the amount of observations in your data frame.

# Instructions
# Use the table() function to create the frequency table for genhlth.
table(cdc$genhlth)
table1 <- table(cdc$genhlth)

# Now create the relative frequency table for the same variable.
table1/nrow(cdc)




# Creating your first barplot

# Making a barplot is easy: you use the function barplot(). 
# This function requires you to put the table inside the barplot() command.
barplot()

# Instructions:
# Draw the barplot with the table with the categorical data of smoke100 as input. 
# (You can do this in one line by nesting table() inside barplot()!)

barplot(table(cdc$smoke100), 
        main="Frequency of Smoke100",
        xlab = "1 = YES | 0 = No",
        col = "lightBlue")




# Question 5

# Create a numerical summary for gender. cdc is available in the workspace. 
# Can you tell how many males are in the sample?
table(cdc$gender)

# Answer:
# m     f 
# 9569 10431




# Question 6

# Compute the relative frequency distribution of genhlth. 
# What proportion of the sample reports being in excellent health? Choose the closest answer. 
# Remember there are 20000 observations in the sample!
table(cdc$genhlth)/nrow(cdc)

# Answer:
# excellent very good      good      fair      poor 
# 0.23285   0.34860   0.28375   0.10095   0.03385




# Even prettier: the Mosaic Plot

# The table command can be used to tabulate any number of variables that you provide.
table(cdc$genhlth, cdc$smoke100)

# Instructions:
# Use the table() function to see how many participants have smoked across each gender. Assign this table to gender_smokers.
gender_smokers <- table(cdc$gender, cdc$smoke100)
gender_smokers

# Plot the contents of this table using the mosaicplot() function.
mosaicplot(gender_smokers)




# Question 7
# What does the mosaic plot reveal about smoking habits and gender? 
# Remember that 1 indicates that a respondent has smoked at least 100 cigarettes.

# Answer: That males are more likely to smoke than females.




# Interlude: How R thinks about data (1)

# Recall the row column rotation.
cdc[1,2]

# Insrucions
# Assign the height of the 1337th respondent to height_1337 using the row-and-column notation. 
# (Use names to see what the index of height is.)
height_1337 <- cdc$height[1337]
weight_111 <- cdc$weight[111]




# Interlude (2)

# You can also subset using an index range. 
# For example, to see the weights for the first 10 respondents you can type 
cdc[1:10, 6]

# Instructions
# Assign the variables between and including hlthplan and height for the first 8 respondents to first8.
first8 <- cdc[1:8,3:5] 

# Assign the variables between and including weight to gender for respondents 10 to 20 to wt_gen_10_20.
wt_gen_10_20 <- cdc[10:20,6:9]




# Interlude (3)

# Instructions

# Assign all variables for the 205th respondent to resp205.
resp205 <- cdc[205,]

# Assign the variables height and weight for all respondents to ht_wt.
ht_wt <- cdc[,c(5,6)]




# Interlude (4)

# You can see the weight for the 567th respondent by typing 
cdc$weight[567]

# imilarly, for the first 10 respondents: 
cdc$weight[1:10]

# Instructions
# Assign the smoking status (smoke100) of the 1000th respondent to resp1000_smk.
resp1000_smk <- cdc$smoke100[1000]

# Assign the data containing the height of the first 30 respondents to first30_ht.
first30_h <- cdc$height[1:30]




# A little more on subsetting

# conditioning commands
# Suppose now you want to extract just the data for the men in the sample, or just for those over 30.
subset(cdc, cdc$gender == "m")

# Instructions
# Use the subset() function to assign the subset of people in very good general health to very_good.
very_good <- subset(cdc, cdc$genhlth == 'very good')


# Assign the subset of people aged over 50 (excluding 50) to age_gt50.
age_gt50 <- subset(cdc, cdc$age > 50)




# Subset - one last time

# You can use several of these conditions together with the

subset(cdc, cdc$gender == "f" & cdc$age > 30)
# Will give you the data for women over the age of 30.

subset(cdc, cdc$gender == "f" | cdc$age > 30)
# Will take people who are women or over the age of 30.

# Instructions
# Create a new object called under23_and_smoke that contains all observations 
# of respondents under the age of 23 that have smoked at least 100 cigarettes in their lifetime.
under23_and_smoke <- subset(cdc, cdc$smoke100 == 1 & cdc$age < 23)
  



# Question 8
  
# How many observations are in the subset under23_and_smoke that you created in the previous exercise, 
# i.e. how many people in the sample are under the age of 23 and have smoked at least 100 cigarettes in their lifetime?
str(under23_and_smoke)

# Answer: 'data.frame':	620 obs. of  9 variables




# Visualizing with box plots

# To construct a box plot for a single variable, you use the boxplot() function. Example: 
boxplot(cdc$weight)

# Instructions
# Draw a box plot of height using the boxplot() function.
boxplot(cdc$height,
        col = 'lightGreen')

# Use the summary() function to also get a numerical summary of the variable.
summary(cdc$height)

# Compare the two results.
# The median and upper and lower quartiles reported in the numerical summary match those in the graph.




# More on box plots

# The purpose of a box plot is to provide a thumbnail sketch of a variable for the purpose of comparing across several categories. 
# So you can, for example, compare the heights of men and women with:
boxplot(cdc$height ~ cdc$gender)

# Instructions
# Use the ~ notation to box plot the weight of respondents as a function of whether or not they smoke (smoke100).
boxplot(cdc$weight ~ cdc$smoke100)




# One last box plot
# Instructions
# Consider the Body Mass Index (BMI). BMI is a weight to height ratio and can be calculated as:
# BMI = (weight(lb)/height(in))*703

# Calculate the BMI:
bmi <- cdc$weight/(cdc$height^2)*703

# Draw a box plot of the BMI versus the general health of the respondents.
boxplot(bmi ~ cdc$genhlth)




# Question 9

# Which of the following is false based on the box plot of 
# BMI vs. general health? The cdc data frame is already loaded into the workspace.

# Answer: The distributions of BMIs within each health status group is left skewed.



# Histograms
# You can look at the histogram for the age of our respondents with the command 
hist(cdc$age)

# With the breaks argument, you have more control over the number of bins. 
hist(cdc$weight, breaks=50) # will split the data across 50 bins.

# Instructions
# Draw a histogram of the bmi object we created in the previous exercise using the hist() function.
hist(bmi)

# Play around with different values for the breaks argument. Try 50 and 100 and see how it affects the generated graph.
hist(bmi, breaks = 50)
hist(bmi, breaks = 100)




# Weight vs. Desired Weight


# Instructions
# Use the plot() function to make a scatterplot of the weight variable versus the wtdesire variable. 
# Both these variables can be found in the cdc data frame which is already available in the workspace.
plot(cdc$weight,cdc$wtdesire)



# Question 10
# Based on the plot you made in the previous exercise, 
# which of the following is true about the relationship between weight and desired weight?

# Answer: moderately strong positive linear association



