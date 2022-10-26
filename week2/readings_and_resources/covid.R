rm(list = ls())  # removes all variables stored previously

# install.packages("Hmisc")
library("Hmisc")

# So that we can find this file in the same directory:
library("rstudioapi")
library(package = "readr")
setwd(dirname(getActiveDocumentContext()$path))

data <- read.csv("COVID19_line_list_data.csv")

# Descriptive stats, using Hmisc:
print(describe(data))

# describe reveals 14 distinct values (not just `0` and `1` as expected)
# => need to clean up the death column:
data$death_dummy <- as.integer(data$death != 0)  # `0` if alive, `1` if dead

# Confirm the death_dummy worked:
print(unique(data$death_dummy))

# Calculate death rate:
print(sum(data$death_dummy) / nrow(data))

# Check the claim that people who die are older than people who survive:
# All the rows where people died/survived:
dead <- subset(data, death_dummy == 1)
alive <- subset(data, death_dummy == 0)

# Mean ages, but some data is missing => need to ignore:
print(mean(dead$age, na.rm = TRUE))
print(mean(alive$age, na.rm = TRUE))

# Is this statistically significant? => Use the T-Test:
print(t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.95))

# Normally, if p-value < 0.05, we reject the Null Hypothesis:
# Here p-value is about 0, so we reject the Null Hypothesis


# Check the claim that gender has no effect:
# All the rows where people died/survived:
men <- subset(data, gender == "male")
women <- subset(data, gender == "female")

# Mean ages, but some data is missing => need to ignore:
print(mean(men$death_dummy, na.rm = TRUE))  # Death rate of 8.5%
print(mean(women$death_dummy, na.rm = TRUE))  # Death rate of 3.7%

# Is this statistically significant? => Use the T-Test:
print(
    t.test(
        men$death_dummy,
        women$death_dummy,
        alternative = "two.sided",
        conf.level = 0.99
        )
)

# 99% confidence: men have from 0.8% to 8.8% higher chance
# of dying.
# p-value = 0.002 < 0.05, so this is statistically
# significant