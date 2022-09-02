############  START OF HYPOTHESIS: 1 BY ISABELLE  ##########
#H1: Developing countries that are in the development group of high, medium and low will rate ramen differently. 
#(1) Lower income countries will rate ramen higher
#(2) High income countries will rate ramen the lowest
#(3) Medium income countries will rate ramen in between lower and high income countries.

#IMPORT AND ASSIGN DATA
RR.raw <- ramen_ratings_raw

c.income.raw <- Country_Income_List_raw

# list of counties form RR Data to see what countries i 
#need to pull form World Bank : https://databank.worldbank.org/home.aspx#

unique_country <- data.frame(Country = unique(RR.raw$Country))
unique_country

############# Clean Up Data Sets  #############

RR.raw <- RR.raw[, -c(1:4,7)]                   # delete columns 1 through 4, as well as 7

c.income.raw <- c.income.raw[, c(1, 3, 29)]     # delete all columns EXCEPT 1, 3, 29

###############Change Col Names to Match##########

colnames(RR.raw)       ## Find the names: Country | Stars 

colnames(c.income.raw)   ##Find the names: Code |  Income.Group | Table.Name  

#names(c.income.raw)[names(c.income.raw) == "Income.Group"] <- "Income Lvl"    #Change for aesthetics 

names(c.income.raw)[names(c.income.raw) == "Table.Name"] <- "Country"         #Change to match at Join 


all.join.H1 <- merge(RR.raw, c.income.raw, all = F)   #make a single table with all cleaned data, used Inner b/c don't want missing values to show up :,)
all.join.H1                                              #Missing scores from HK and South Korea 

#The goal is to find the mean from star ratings, 
#here I want to make sure the class is in the numeric form. 
class(all.join.H1$Stars)     #It is not, it is in "character", this will need to change

#there is also 'unrated' at line 867
all.join.H1 <- all.join.H1[-c(867), ]   # remove the row and reassigned 

#there are alot of 0's as well, want to remove this b/c it will effect the mean
all.join.H1 <- all.join.H1[-c(789, 237, 173, 143, 124, 117, 106, 75, 71, 49, 41, 1302), ]    # remove the row and reassigned     


all.join.H1 %>%
  filter(Stars != 'Unrated') %>%                ### Remove variables names 'Unrated' in the star col
  mutate(Stars = as.numeric(Stars)) %>%         ### Changing star col to numeric  
  group_by(Income.Group, Country)  %>%          ### Make sure there col match with each other 
  summarise(avg_stars = mean(Stars)) %>%        ### find mean of ALL stars even if there are NAs
  summarise(avg_stars = mean(avg_stars),        ### find mean of stars from Income.Group
            number_of_countries = n()) -> result.H1       ###  Income.Group/Countries
result.H1


####### Plot  #####

all.join.H1 <-  subset(all.join.H1, Stars != 'Unrated')       ### Remove variables names 'Unrated' in the star co
as.numeric(all.join.H1$Stars) -> all.join.H1$Stars            ### 
mean_data <- aggregate(Stars~Income.Group, all.join.H1, mean)
barplot(mean_data$Stars, 
        main='Hypothesis Results', 
        ylim=c(0, 5),                         ### star rating based out of 5 so the scale is 0:5
        xlab='Mean Based on GNI',             ### X title
        ylab='Star Rating',                   ### Y title
        border='blue', 
        col='blue',
        density=1, 
        names.arg = mean_data$Income.Group)


#################### End of H:1 by Isabelle  ###########################
