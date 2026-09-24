# Problem Set 5 Script

install.packages("tidyverse")

library(dplyr)
library(tidyverse)


# Q1: Use CCES/CES Cumulative file
ces <- read_dta('~/Documents/PAI741/Problem Set 5/CES Data/cumulative.dta')

# Q2: Use only 2024 data
ces2024 <- ces %>% filter(ces$year==2024)
# Recode 5 category ideology variable to a three category: liberal, moderate, conservative

ces2024$ideo5
ces2024 <- ces2024|>
  mutate(ideo3 = case_when(
    ideo5 %in% 1:2 ~ 1,
    ideo5 %in% 3 ~ 2,
    ideo5 %in% 4:5 ~ 3,
    ideo5 == 6 ~ NA
  ))

ces2024$ideo3

# Q3 Recode presidential vote to look at just 2 party vote 
# Other candidates to missing values

# Check column names ot figure out which variable to use
colnames(ces2024)

# Look at labels
ces2024$voted_pres_24

# Recode into 2 candidates
ces2024 <- ces2024 |>
  mutate(voted_pres_2 = case_when(
    voted_pres_24 %in% 1 ~ 1,
    voted_pres_24 %in% 2 ~ 2,
    voted_pres_24 %in% 3:8 ~ NA
  ))

ces2024$voted_pres_2



# Q4 Table 
table(ces2024$ideo5, ces2024$voted_pres_2)

# What proportion of respondents who are liberal voted for Trump? 
# What proportion of respondents who are conservative voted for Harris?




# Q5 
# Find the variable that refers to whether people own or rent their home.
# Recode the variable so that “other” is missing



# Q6 Table
#  What portion of people who own their homes voted for Trump? Harris? 
# What portion of people who rented voted for Trump? Harris?


# Q7 
# locate education variable
# recode variable so those <= hs degree =1, 
# some college<4 yrs = 2
# college degree = 3, post-grad = 4


# Q8 Table
# What does education tell us about vote in the 2024 election.

# Render your quarto file to .html and .pdf.


