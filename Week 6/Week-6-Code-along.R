######################
### W6: Code along ###
######################

# Install packages
## We have to first install packages before we can load them (with install.packages() then library())
## shortcut: Ctrl + Enter/Cmd + Return

install.packages("educationdata")
library(educationdata)
#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("skimr")
library(tidyverse)
library(dplyr)
library(skimr)

# Start small
df <- get_education_data(level = "schools",
                         source = "ccd",
                         topic = "enrollment",
                         filters = list(year = 2021, grade = 12))
df <- df %>% as_tibble() # to make inspecting the df easier

df %>% 
  skim(ncessch) # National Center for Education Statistics (NCES) identification number
                # how many schools are there in the data?

# Expanding
df_2 <- get_education_data(level = "schools",
                           source = "ccd",
                           topic = "directory",
                           filters = list(year = 2021))
df_2 <- df_2 %>% as_tibble() # to make inspecting the df easier
df_2 %>% skim(ncessch) # how many schools in the U.S.
df_2 %>% skim(state_location) # number of unique states

df_2 %>% 
  group_by(state_location) %>%  # Grouping data by state
  summarise(num_schools = n()) # number of schools by state

df_2 %>% 
  group_by(state_location) %>%
  summarise(num_schools = n()) %>%
  print(n = 56) # to see all the rows (n=56)

# District data
df_3 <- get_education_data(level = "school-districts",
                           source = "ccd",
                           topic = "directory",
                           filters = list(year = 2021))
df_3 <- as_tibble(df_3)
df_3 %>% skim(leaid)  # Local education agency identification number (leaid)
                      # how many districts in the U.S. 
df_3 %>%
  group_by(state_location) %>%  # Grouping the data by state
  summarise(num_districts = n())  # Counting the number of districts in each state

df_3 %>%
  group_by(state_location) %>%  
  summarise(num_districts = n()) %>% 
  print(n = 57) # to see all the rows (n=57)
