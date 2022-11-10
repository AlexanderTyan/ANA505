# Week 4 Notes
## Overview of data cleaning
- Motivation: It is often said that 80% of data analysis is spent on the process of cleaning and preparing the data
- Step 1: Find the dirt (i.e. possible issues):
  - Are there rows with empty values? Entire columns with no data? Which data is missing and why?
  - How is data distributed? Remember, visualizations are your friends. Plot outliers. Check distributions to see which groups or ranges are more heavily represented in your dataset.
  - Keep an eye out for the weird: are there impossible values? Like “date of birth: male”, “address: -1234”.
  - Is your data consistent? Why are the same product names written in uppercase and other times in camelCase?
  
- Step 2: Scrub the dirt (i.e. possible remedies):
  - Missing data:
    - drop rows and or columns with missing data
    - recode missing data into a different format
    - fill in missing values with best guesses
  - Outliers:
    - remove outliers form the analysis
    - segment data so outliers are in a separate group
    - keep outliers, but use different statistical methods for analysis
  - Contaminated data, Inconsistent data, Invalid data
  - Data type issues:
    - cleaning strings
    - cleaning date and time
    - Standardize and normalize data
    - Structural errors
- Step 3: Repeat steps 1 and 2
  - You might have missed something
  - You might discover new issues
  - You learn more about your data
  - "Garbage in, garbage out"
- Definition of Tidy data:
  1. Each variable forms a column.
  2. Each observation forms a row.
  3. Each type of observational unit forms a table
- Definition of NOT Tidy data (non-exhaustive; The five most common problems with messy datasets, along with their remedies):
  - Column headers are values, not variable names.
  - Multiple variables are stored in one column.
  - Variables are stored in both rows and columns.
  - Multiple types of observational units are stored in the same
table.
  - A single observational unit is stored in multiple tables.
- Data Cleaning/Preparation tools:
  - R's `tidyr`
  - R's `dplyr`