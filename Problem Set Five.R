# Problem Set 5 Script
# Author: Kerri Riley

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
# Regular Table
table(ces2024$ideo3, ces2024$voted_pres_2)

# Shows the Proportions
prop.table(table(ces2024$ideo3, ces2024$voted_pres_2), margin = 1)


# What proportion of respondents who are liberal voted for Trump? 
379/(13541+379)
# 2.7% or 0.027 of respondents who are liberal, voted for Trump. 

# What proportion of respondents who are conservative voted for Harris?
999/ (999+12907)
# 7.2 or 0.072 of respondents who are conservative vited for Kamala Harris. 

# Q5 
# Find the variable that refers to whether people own or rent their home.
ces2024$ownhome

# Recode the variable so that “other” is missing
ces2024 <- ces2024 |>
  mutate(clean_ownhome = case_when(
    ownhome %in% 1 ~ 1,
    ownhome %in% 2 ~ 2,
    ownhome == 3 ~ NA
  ))
# Check
ces2024$clean_ownhome

# Q6 Table
table(ces2024$voted_pres_2, ces2024$clean_ownhome)

# What portion of people who own their homes voted for Trump? Harris? 
# HO Trump
14619 / (14619 + 13700)
# HO Kamala 
13700 / (14619 + 13700)
# 51% or 0.52 respondents who own homes, voted for Trump, and 48% voted for Kamala Harris.

# What portion of people who rented voted for Trump? Harris?
# Renters Trump
4117 / (7593 + 4117)
# Renters Harris
7593 / (7593 + 4117)
# About 35% of Trump voters rent, and 65% of Harris voters rent.

# Q7 
# locate education variable
ces2024$educ
# recode variable so those <= hs degree =1, 
# some college<4 yrs = 2
# college degree = 3, post-grad = 4

ces2024 <- ces2024 |>
  mutate(educ_4 = case_when(
    educ %in% 1:2 ~ 1,  # HS degree or less
    educ %in% 3:4 ~ 2,  # Some college, less than 4 years
    educ %in% 5 ~ 3,  # College degree
    educ %in% 6 ~ 4   # Post-grad
  ))

# Check recoding worked
ces2024$educ_4

# Q8 Table
table(ces2024$voted_pres_2, ces2024$educ_4)

# What does education tell us about vote in the 2024 election.
# Education is associated with presidential vote choice in this sample. As education level increases, the proportion voting for Harris increases, while the proportion voting for Trump decreases. Trump received a larger share among respondents with a high school education or less, while Harris received a larger share among respondents with some college, a college degree, or postgraduate education. The difference was largest among respondents with postgraduate education.

# Render your quarto file to .html and .pdf.


