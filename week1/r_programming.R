# This is an `.R` script

# Calling a print function:
print("Hello world!")

# Install a package (commented out for now):
# install.packages(pkgs = "phonenumber")

# Import a package (once it is installed):
library(package = "phonenumber")
# See the vignette:
# print(vignette(package = "phonenumber"))

# Call help on a package's function:
# print(?letterToNumber)

# Variable assignment:
fedex_number <- "GoFedEx"
print(letterToNumber(value = fedex_number))

# Vector object:
print(c("Harry", "Ron", "Hermione"))

# Storing a vector:
main_characters <- c("Harry", "Ron", "Hermione")
print(x = main_characters)

# Numeric vector:
n_kids <- c(1, 7, 1)
print(n_kids)

# Coercion of types:
mixed_classes <- c(1, 3, "five")
print(mixed_classes)
print(class(x = mixed_classes))

# Vector length:
print(length(x = mixed_classes))

# Vector indexing:
print(main_characters[2]) # Get the second value

# Indexing multiple elements in a vector:
print(main_characters[c(1, 3)]) # Get first and third values

# Range of values via the colon operator (includes 1st and last):
print(1:10)

# More indexing:
print(main_characters[1:2]) # Get the first two values

# Note on quotation marks: R can be inconsistent. E.g. can do, w/o quotes, 
# though quotes are expected:
library(package = phonenumber)


# DataFrames (using `tibble`):

# Note: Generic code
# [name of object] <- tibble([1st column name] = [1st column content],
                        #    [2nd column name] = [2nd column content])


library(package = "tibble")
hp_data <- tibble(first_name = c("Harry", "Ron", "Hermione"),
                  last_name = c("Potter", "Weasley", "Granger"),
                  n_kids = c(1, 7, 1),
                  survived = c(TRUE, TRUE, TRUE))
print(hp_data)

# Using already saved vectors:
hp_data <- tibble(first_name = main_characters,
                  last_name = c("Potter", "Weasley", "Granger"),
                  n_kids = n_kids,
                  survived = c(TRUE, TRUE, TRUE))
print(hp_data)

# Load a DataFrame from a CSV, using `readr` package:
# install.packages("readr")
library("rstudioapi") 
library(package = "readr")

# So that we can find this file:
setwd(dirname(getActiveDocumentContext()$path))

daily_show <- read_csv(file = "daily_show_guests.csv",
                       skip = 4)

# DataFrame characteristics:
print(dim(x = daily_show))
print(nrow(x = daily_show))
print(ncol(x = daily_show))
print(str(object = daily_show))  # Structure of an R object
print(summary(object = daily_show))  # Summarize DataFrame columns

# Extract 1st 2 rows, using `dplyr`:
# install.packages("dplyr")
library(package = "dplyr")
print(slice(.data = hp_data, c(1:2)))

# Extract 1st and 4th columns, using `dplyr`:
print(select(.data = hp_data, c(1, 4)))

# DataFrame indexing:
print(hp_data[1:2, 2])  # First two rows, second column

print(hp_data[3, ])  # Last row, all columns


