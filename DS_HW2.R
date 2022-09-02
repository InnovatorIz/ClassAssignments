#Isabelle 


# 1. Load data file
HW2_Data <- read.csv("/Users/isabelle/Desktop/Data_Science_COMP_7150/HW/Homework-2_data.csv")
HW <- read.csv("/Users/isabelle/Desktop/Data_Science_COMP_7150/HW/Homework-2_data.csv")

#2. Provide to me the structure of the loaded data set
str(HW2_Data)

#3. Provide me a “summary” of the loaded data structure
#Casual 
summary(HW2_Data)

#Psychological ie. skew, kurtosis, range ect...
library(psych)
describe(HW2_Data)

#4.Count of releases per year
library(plyr)
count(HW2_Data$Year)

#5.Count of releases for each group of two years (i.e. 1992 and 1993, 1994 and 1995, etc).
library(dplyr)

# Group 1991
one <- filter(HW2_Data, Year == "1991")
# Group 1992 & 1993 
nine23 <- HW2_Data[ !is.na(HW2_Data$Year) & (HW2_Data$Year == 1992 | HW2_Data$Year == 1993) , ]
#Group 1994 & 1995
nine45 <- HW2_Data[ !is.na(HW2_Data$Year) & (HW2_Data$Year == 1994 | HW2_Data$Year == 1995) , ]

#show rows
nrow(one)
nrow(nine23)
nrow(nine45)


# 6.  Average number of the Lines of Code (LOC) per releases per year.
library(tidyverse)
#I do not know how to cancel out of previous library without using the UI
HW2_Data %>%
  group_by(Year) %>%
  summarise(mean = mean(LOC)) -> avg.LOC
avg.LOC 



#7.  Average size of the file size per year.
HW2_Data %>%
  group_by(Year) %>%
  summarise(mean = mean(Tar.Size)) -> meanTar
meanTar

#8. Create a single data frame through code which contains the year along with the 
# avg, median, and standard deviation for LOC and tar file variables.
HW2_Data %>%
  group_by(Year) %>%   #year 
  summarise(Tar_mean = mean(Tar.Size),  #avg/mean
            Tar_median = median(Tar.Size),  #median
            Tar_sd= sd(Tar.Size))  -> df.Tar        #sd
df.Tar 

HW2_Data %>%
  group_by(Year) %>%   #year 
  summarise(LOC_mean = mean(LOC),  #avg/mean
            LOC_median = median(LOC),  #median
            LOC_sd= sd(LOC))  -> df.LOC        #sd
df.LOC

All.Inner.Join <- merge(df.LOC, df.Tar) #Inner Join the Tar and LOC sets 
print(All.Inner.Join)

#Bonus: For an all or nothing bonus of 10 points, 
#find something interesting to tell me about from this data or about this assignment!
#Note that this is subjective on my part and is intended to challenge you to go beyond the constraints of the above questions!

# I think its cool that linux is an elder millennial
# I would also assume that as the years went on it would have less 
# I need to review more, but the trend is that with each update, there is more Tar.

year <- HW2_Data$Year
tar <- HW2_Data$Tar.Size
LOC <- HW2_Data$LOC

cor(year,tar) -> tar.year
plot(tar,year, pch=17, col='green')

cor(LOC, year) ->loc.year
plot(LOC, year, pch=17, col='pink')

LOC -tar -> playing_around_with_numbers 
playing_around_with_numbers 
