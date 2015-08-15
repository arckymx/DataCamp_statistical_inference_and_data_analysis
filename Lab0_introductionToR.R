# DataCamp
# Data Analysis and Statistical Inference
# lab 1 introduction to R




# Load a dataset into R
read.table()

# Read in your data set and assign to the object:
present <- read.table ("http://assets.datacamp.com/course/dasi/present.txt")




# Examining the data set

# R has stored the data in a kind of spreadsheet or table called a data frame.

# Print the number of rows and variables with the 'dim' function:
dim(present)

# Print the names of the variables of the data frame:
names(present)




# Question 1

# How many variables are included in the present data set? 
# The data set is already available in the workspace; 
# you can inspect it by executing present in the console on the right!

# Answer - use the names function
names(present)

# ANS: "year"  "boys"  "girls" (3 variables)




# Some more exploration

# Find the number of boys born each year, and assign your answer to 
num_boys <- present$boys

# Find the number of girls born each year, and assign your answer to
num_girls <-  present$girls

# This will print the results
num_boys
num_girls




# Question 2
#What command would you use to view just the counts of girls born?
present$girls




# Putting it in a graph

# R has powerful graphical capabilities. 
# We can create a simple plot of the number of girls born per year with a command of the form plot(x, y).
plot()

# Type here the code to create the plot:
plot(present$year, present$girls)




# Connecting the dots

# We could add a third argument: type = "l" (with l being short for line).
plot(present$year, present$girls, type = "l")




# Using the help function

# Thankfully, R documents all of its functions extensively.
# To read what a function does, and learn the arguments that are available to you, just type in a question mark followed by the name of the function in the console!

# Look for the documentation of the read.table function in the console
?read.table




# R - The big calculator

# When adding the vectors with the births of boys and girls respectively, R will automatically take the element-wise sum.

# The vector babies:
babies <- (present$boys + present$girls)
babies

present2 <- cbind(present,babies)

# Your plot
plot(present$year, babies, type = "l")




# Question 4
# In what year did we see the most total number of births in the US? 
# You can experiment with the present data set in the console; 
# it's already loaded in the workspace. 
# The babies variable that you've defined in the previous exercise is also available.

#use the max function
max(babies)
present2[present2$babies==4268326,]



# Question 5
# Make a plot of the proportion of boys over time, 
# and based on the plot determine if the following statement is true or false: 
# The proportion of boys born in the US has decreased over time.

# Determine the ratio vector
propboys <- present$boys/(present$girls + present$boys)

# Visualize the trend using a plot
plot(present$year, propboys, type = "l")




# Comparing the data set

# In addition to simple mathematical operators like subtraction and division, you can ask R to make comparisons: 
# greater than with >, less than with <, and equality with ==

# Check when boys outnumber girls
present$boys > present$girls




# Question 6
# T/F Every year there are more boys born than girls.
present$boys > present$girls



# Challenge

# The present dataset is already loaded.
# Plot the boy-to-girl ratio for every year:

# Set the boy-to-girl ratio
bgratio <- present$boys/present$girls

# Create the plot
plot(present$year, bgratio, type = "l")



# Question 7

# What do you see in the boy-to-girl ratio plot?
# There is initially a decrease in the boy-to-girl ratio, and then an increase between 1960 and 1970, followed by a decrease.




# Question 8

# Calculate the absolute differences between number of boys and girls born in each year; 
# which year out of the present data had the biggest absolute difference in the number of girls and number of boys born? 
# present is loaded in the workspace so you can start right away.

# Create difference vector
diff <-present$boys - present$girls

# Find the max differece
max(diff)

# Creat new data.frame containing present and diff
present3 <- cbind(present,diff)

# select the colum with max diff
present3[present3$diff==105244,]

# Or

present3[present3$diff==(max(diff)),]



