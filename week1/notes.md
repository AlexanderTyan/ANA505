# Notes
## CRISP-DM
- most popular process to date
- data mining is the whole process
- support feedback, checks, balances
- independent of tooling
- 6 steps

### Step 1: Business Understanding (aka Organizational Understanding)
- Business problem defined and characterized
- Define questions to answer
- Can take longer if you are not part of business

### Step 2: Data Understanding
- Business already clearly defined at Step 1
- Is there data to answer the question?
- Where is the data?
- In what form is it?
- Who collected it?
- What was the collection method?
- Potential problem: data silos and accessibility
- Identifying existing data and its sources
- Interpreting columns/rows
- Learning terms/acronyms/abbreviations, etc.
- Sometimes need to consult with Subject Matter Experts across various departments

### Step 3: Data Preparation

- Converting data into a form which the data mining tool will understand properly
- Some data mining tools are flexible and can reformat the data before processing it
- Steps 1, 2, 3 = 85 - 90 \% of total project time
- Many data types
- Common tasks
    - Joining/splitting data sets
    - Reducing data sets to interesting variables
    - Scrubbing anomalies/identifying outliers
    - Identifying missing data


### Step 4: Model Building/Modeling

- The fun part
- Model building/testing
- **Model** - computerized representation of real-world observations; application of algorithms to seek out, identify, and display any patterns or messages in data
    - 2 types: classification and prediction
        - E.g. decision tree - prediction

    - Various degrees of complexity possible

- Development/Interpretation stage

### Step 5: Testing and Evaluation

- Validation of the findings against the business problem
- To make sure the problem and modeling aligns with the business need
- To determine how valuable the model is 
- Both data-driven (e.g. cross-validation/power) and non-measurable operational knowledge used

### Step 6: Deployment

- The reuse of the discovered pattern (not every pattern is deployed)
- Answering the question
- Plugging the model into continuous decision-making
- Automating the model
- Meeting with consumers, communicating expectations clearly
- Feeding updates back into the model to improve accuracy/performance
- Monitoring/measuring model outcomes
- Initial distrust/pushback is common
- Must seek balance between skepticism and trust 

