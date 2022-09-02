# Isabelle 
# Final Project Clean Code 
# after leaning how to use scrapy, i wans then tasked with the goal of cleaning and sorting data
# please note this is one of my first projects and was under a limited amout of time
# as a result I made notes detailing what i was doing and why 

corse_corp <- VCorpus(DirSource('C:/Users/isabellek/Desktop/ikernell_poject'))


library(dplyr)    
library(tidyr)
library(wordcloud)
library(tm)
library(RColorBrewer)
library(ggplot2)

#import  
raw_plants1 <- ('C:/Users/isabellek/Desktop/ikernell_poject')

rp <- raw_plants1

#only the raw data singe column, can come back to it easity if there is a mess up
all_raw <- rp$all
all_raw

### simple cleaning of the Corpus ###

all_raw %>%
  tolower(.) %>%                         # lower case 
  gsub("[[:punct:]]", " ", .)%>%         # remove punctuation 
  removeWords(stopwords("english")) %>%  # remove small words that should not effect the whole mean 
  stripWhitespace(.)  -> clean_plants    # remove larger spaces, good to save for the end 
clean_plants


### db prep ### 
#I officially  now understand what unstructured data means 

db.clean <- clean_plants
db.clean

# putting it back in to a data frame after cleaning
clean.df <- data.frame(all.clean = c(db.clean), stringsAsFactors = FALSE)

clean.df %>%
  select(all.clean) %>%
  separate(all.clean, c("other", "W"), sep = e) %>%  # find the "full sun" 
  separate(W, c("X"), sep = sh) %>%                  # find the "partial sun"
  separate(X, c("Y"), sep = so) %>%                  # remove excess, wanted to remove sun but needed to move on 
  separate(Y, c("Sun_Expo"), sep =lat) %>%           # remove excess
  mutate(Char_Num = nchar(Sun_Expo)) %>%             # IDed the char num to go buy for time suggestion  
  mutate(Time_Hrs = ifelse(Char_Num == 18 |              # apart of "full sun partial"
                       Char_Num == 6 |               # apart of "full"
                       Char_Num == 10,               # apart of "full sun"
                       yes = "6 or more", no = "3-6"))  -> plant.df   # time suggestion col  

## Make Groups ##

Sun_Group  <- plant.df

Sun_Group %>%
  count(Sun_Expo) -> s.group
  
### Visuals ##

# I realized that because it was more of a text set of data, word cloud might be better suited 

other <- Sun_Group$other

sun_types <- Sun_Group$Sun_Expo


# the most common type of sun requirement 
# this is an issue in the data "full" should be defined with "full sun"
wordcloud(words = s.group$Sun_Expo, 
          freq = s.group$n,
          min.freq = 1,
          max.words=26,
          random.order=FALSE,
          rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

wordcloud(words = Sun_Group$other,
          freq = Sun_Group$`nchar(Sun_Expo)`,
          min.freq = 1,
          max.words=26,
          random.order=FALSE,
          rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))



# Plot fails, I was trying to ID the words to numerical value but was not successful kept trying to line up the 


plot(Sun_Group$Char_Num,
     main="Scatterplot Example", 
     ylab = "Sun Exposure",
     xlab = "Length of Time")


hist(s.group$n)

hist(s.group,
     s.group$n,
     main = "Plants ", 
     ylim = c(0,15),
     yaxp = c(0,0,8),
     border = "blue", 
     col = "green")
  

# corpus list of all the words
txt_corp <- Corpus(VectorSource(clean1))
txt_corp

# turn into a matrix for calc 
dtm <- DocumentTermMatrix(txt_corp)

dtm.frame <- as.matrix(dtm)
dtm.frame

# lines it up better, 
dtm.frame <- t(dtm.frame)

# sum number 
sun_sum <- rowSums(dtm.frame)

# common words form the raw all col
sun_sum %>%
  sort(decreasing = T) %>%       #sort by most 
  head(.)     -> ss                    # top used 



#word cloud
wordcloud(head(names(sun_sum), 30), 
          head(sun_sum, 30), 
          scale = c(2,1),
          colors = blues9)
