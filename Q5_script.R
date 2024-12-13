#Importing the dataset
virus_data <- read.csv("question-5-data/Cui_etal2014.csv")

#Viewing the dataset so I can see number of rows and columns
View(virus_data)

#Necessary packages
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

#log transforming the data, and creating a new dataset with log values
log_data <- virus_data %>%
  mutate(log_length = log(Genome.length..kb.)) %>%
  mutate(log_volume = log(Virion.volume..nm.nm.nm.))

#now making a linear model with 'log_data'
#log_length is the predictor variable, and log_volume is the response variable
#summary() gives the output
linear_model <- lm(log_volume ~ log_length, log_data)
summary(linear_model)

#plotting data with log transformation

ggplot(data = virus_data, aes(x = log(Genome.length..kb.), y = log(Virion.volume..nm.nm.nm.)))+
  geom_point() + #adding data observations as points
  geom_smooth(method = lm) + #adding fitted regression line
  labs(x = "log[Genome length (kb)]", y = "log[Virion volume (nm3)]" ) + #adding axes labels
  theme_bw() + #aesthetics
  theme(axis.title.x = element_text(size = 12, face = "bold"), #making x-axis title look nice
        axis.title.y = element_text(size = 12, face = "bold"))  #making y-axis title look nice


