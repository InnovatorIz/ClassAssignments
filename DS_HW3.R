#HW3 
#Isabelle 

library(dplyr)
############ 1. ############ 
#Create a data set with the following values.
x <- c(94, 90, 72, 72, 95, 7, 89, 36, 61, 30, 80, 15, 73, 99, 24,
      96, 36, 40, 39, 84, 4, 12, 39, 8, 96, 7, 38, 91, 84, 49, 3, 34,
      52, 6, 11, 2, 54, 75, 61, 47, 62, 73, 41, 41, 12, 77, 81, 74,
      44, 97, 10, 15, 5, 53, 26, 1, 36, 15, 37, 3, 86, 93, 92, 28,
      42, 44, 57, 19, 67, 18, 37, 46, 94, 50, 84, 52, 56, 49, 32, 17,
      23, 69, 96, 95, 69, 67, 52, 85, 58, 13, 6, 4, 89, 40, 26, 73,
      9, 70, 29, 41, 57, 91, 77, 54, 53, 63, 88, 39, 98, 71, 67, 14,
      2, 82, 42, 8, 34, 7, 54, 7, 79, 12, 97, 26, 94, 85, 13, 12, 75,
      2, 58, 6, 43, 12, 59, 25, 81, 10, 28, 96, 61, 16, 41, 41, 32,
      82, 48, 3, 21, 75, 85, 1, 98, 84, 7, 42, 30, 28, 47, 13, 5, 34,
      34, 14, 7, 59, 90, 84, 40, 7, 21, 68, 27, 95, 11, 23, 86, 83,
      28, 23, 80, 42, 32, 25, 76, 28, 82, 1, 93, 38, 8, 79, 96, 82,
      24, 75, 96, 43, 62, 35)

############ 2. ############ 
#Identify the mean, standard deviation, quartiles, and median using any method available to you. 
mean(x) #mean
sd(x) #Standard deviation
quantile(x) #quartiles
median(x) #median

############ 3. ############ 
#Using the sample function, sample the vector above to create a new vector of length n where n = {10, 50, 75, 100, 150}.  
#For each of these new vectors, calculate the value of mean, standard deviation, quartiles, and median. 
#Explain what is happening in the above scenario as the sample size increases.

### n=10 ###
n10 <- sample(x, 10, replace = F, prob = NULL) #size n=10
n10
mean(n10) #mean of n10
sd(n10) #Standard deviation of n10
quantile(n10) #quartiles of n10
median(n10) #median of n10

### n=50 ###
n50 <- sample(x, 50, replace = F, prob = NULL) #size n=50
n50 
mean(n50) #mean of n50
sd(n50) #Standard deviation of n50
quantile(n50) #quartiles of n50
median(n50) #median of n50

### n=75 ###
n75 <- sample(x, 75, replace = F, prob = NULL) #size n=75
n75
mean(n75) #mean of n75
sd(n75) #Standard deviation of n75
quantile(n75) #quartiles of n75
median(n75) #median of n75

### n=100 ###
n100 <- sample(x, 100, replace = F, prob = NULL) #size n=100
n100
mean(n100) #mean of n100
sd(n100) #Standard deviation of n100
quantile(n100) #quartiles of n100
median(n100) #median of n100

### n=150 ###
n150 <- sample(x, 150, replace = F, prob = NULL) #size n=150
n150
mean(n150) #mean of n150
sd(n150) #Standard deviation of n150
quantile(n150) #quartiles of n150
median(n150) #median of n150

############  4/5 This will require some thinking. ############ 
# I would like you provide statistical evidence that a coin flop has a 50/50 probability of landing on heads (or tails)
# by generating a vector of length 200 and applying the concepts of mean, median, standard deviation, etc.
# to evaluate the data set. Hint: you may have to run your experiment more than once! 
# A) For your answer, please provide any code / results that you use. 
# B) Please provide a short paragraph describing why your findings are evidence that a coin flop has 50/50 probability of landing on heads or tails.


############ Q4/5 PART A ############  


#virtual coin 
coin <- c(1 , 0) # 1= Heads, 0= Tails 
coin

#replace = T, b/c heads/tails is a binary variable, want repented numbers
#prob = NULL, b/c want a true probability without giving weight to a 1 or 0 

############ First Toss = tossed.1 ############ 
tossed.1 <- sample(coin, 200, replace = T, prob = NULL)   
tossed.1

mean(tossed.1) #mean of tossed.1
sd(tossed.1) #Standard deviation of tossed.1
quantile(tossed.1) #quartiles of tossed.1
median(tossed.1) #median of tossed.1
table(tossed.1) #counting how many heads or tails in tossed.1

############ Second Toss = tossed.2 ############ 
tossed.2 <- sample(coin, 200, replace = T, prob = NULL)  #replace = T, b/c heads/tails is a binary variable, want repented numbers 
tossed.2

mean(tossed.2) #mean of tossed.2
sd(tossed.2) #Standard deviation of tossed.2
quantile(tossed.2) #quartiles of tossed.2
median(tossed.2) #median of tossed.2
table(tossed.2) #counting how many heads or tails in tossed.2


############ Third Toss = tossed.3 ############ 
tossed.3 <- sample(coin, 200, replace = T, prob = NULL)  #replace = T, b/c heads/tails is a binary variable, want repented numbers 
tossed.3

mean(tossed.3) #mean of tossed.3
sd(tossed.3) #Standard deviation of tossed.3
quantile(tossed.3) #quartiles of tossed.3
median(tossed.3) #median of tossed.3
table(tossed.3) #counting how many heads or tails in tossed.3


############ Forth Toss = tossed.4 ############ 
tossed.4 <- sample(coin, 200, replace = T, prob = NULL)  #replace = T, b/c heads/tails is a binary variable, want repented numbers 
tossed.4

mean(tossed.4) #mean of tossed.3
sd(tossed.4) #Standard deviation of tossed.3
quantile(tossed.4) #quartiles of tossed.3
median(tossed.4) #median of tossed.3
table(tossed.4) #counting how many heads or tails in tossed.4

############ Loop Challenge ############  
looped.coins <- matrix(NA, nrow=200, ncol = 20)
for (i in 1:200) {
  looped.coins[i, ] <- sample(c(1,0), 2, replace = T, prob = NULL)
}

mean(looped.coins) #mean of looped.coins
sd(looped.coins) #Standard deviation of looped.coins
quantile(looped.coins) #quartiles of looped.coins
median(looped.coins) #median of looped.coins
table(looped.coins)

hist(looped.coins)

############ Q4/5 PART B ############  
#Please provide a short paragraph describing why your findings are evidence that a coin flop has 50/50 probability of landing on heads or tails.


#Each time a virtual coin was flipped the mean, and standard deviation gave percents, 
#that when rounded to the nearest tens, would be .5. Representing a bell curve in a graph. 
#If I were to do it again I would also add variance and visual for histogram.

#And I think* that the data set I made looped.coins demonstrates a Pascal's triangle. 

