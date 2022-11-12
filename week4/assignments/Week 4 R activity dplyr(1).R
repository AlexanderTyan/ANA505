#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice

# Note: not sure if "write" means "define and call" or just "call";
# will define a function, just in case
get_haireyecolor <- function() {
    #' Returns HairEyeColor in the from Base R
    return(HairEyeColor)
}

hair_eye_sex_color <- get_haireyecolor()

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

# Note: going to just do a 'call' here; defining seems redundant:
print(head(x = hair_eye_sex_color, n = 2))


#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages(pkgs = "dplyr")
# This is not strictly speaking necessary as I'll call `dplyr` explicitly
library(package = "dplyr")

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns
#(hint: use the 'select' function)

# `hair_eye_color` (or `HairEyeColor`) is a table, but `dplyr` needs a
# dataframe
hair_eye_sex_color <- as.data.frame(hair_eye_sex_color)

# Now we can `select` (direct explicit call do dplyr is my opinionated use)
print(dplyr::select(.data = hair_eye_sex_color, Hair, Sex))


#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

hair_sex_color <- dplyr::select(.data = hair_eye_sex_color, Hair, Sex)


#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

print(dplyr::select(.data = hair_sex_color, Hair))

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'

# I'm assuming the original data.frame here, since we just dropped `Sex` column
print(dplyr::rename(.data = hair_eye_sex_color, gender = Sex))


#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender'
#column

hair_eye_gender_color <- dplyr::rename(
    .data = hair_eye_sex_color, gender = Sex
    )


#Let's 'filter' just the females from our dataset
#TASK: Write the function that includes only rows that are 'female'

females_only <- dplyr::filter(
    .data = hair_eye_gender_color, gender == "Female"
    )
print(females_only)

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)

# I'm assuming not the filtered dataset with females only, but the whole
# dataset
print(dplyr::group_by(.data = hair_eye_gender_color, gender))


#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here: 592

# I'm assuming the original data.frame, not the one with females only
total <- dplyr::mutate(hair_eye_gender_color, total = cumsum(Freq))
print(sprintf("Total is: %s", tail(total, n = 1)$total))
# Let's double check, just in case:
stopifnot(sum(hair_eye_gender_color$Freq) == tail(total, n = 1)$total)


#Since we have a females dataset, let's make a males dataset
#TASK: Write the function that includes only rows that are 'male'

males_only <- dplyr::filter(
    .data = hair_eye_gender_color, gender == "Male"
    )
print(males_only)


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows
#(hint: try using 'union' or 'bind_rows')

joined_data <- dplyr::bind_rows(
        # Play with tracking the pre-bind source:
        "females data" = females_only,
        "males data" = males_only,
        .id = "source"
    )
print(joined_data)


#Optional Task: add any of the other functions
#you learned about from the dplyr package

# make all col names lower case for consistency
joined_data  <- joined_data %>% rename_all(tolower)
print(head(joined_data))

# Get counts and proportions for each group, in descending order

get_count_prop_by_group <- function(data_frame, group_name, total) {
    # group_name in str form
    count_by_group <- data_frame %>%
        group_by(!!sym(group_name)) %>%
        summarise(n = sum(freq)) %>%
        mutate(proportion = (n / total)) %>%
        arrange(desc(proportion))
    return(count_by_group)
}

# For single groups
group_names <- c("hair", "eye", "gender")
total <- sum(joined_data$freq)
for (group_name in group_names) {
    count_by_group <- get_count_prop_by_group(joined_data, group_name, total)
    print(count_by_group)
}

# Is there a difference of proportions by gender within each hair color?
count_by_hair_gender <- joined_data %>%
        group_by(hair, gender) %>%
        summarise(n = sum(freq)) %>%
        group_by(hair) %>%
        mutate(total_in_hair_group = sum(n)) %>%
        mutate(proportion_within_hair = n / total_in_hair_group)
print(count_by_hair_gender)
