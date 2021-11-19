# Box Office Predictions

-   authors: Steven Leung, Sam Quist, Brandon Lam, Ruben De la Garza Macias

Data analysis project for DSCI 522 (Data Science workflows); a course in the Master of Data Science program at the University of British Columbia.

## Introduction

For this project we will attempt to create a machine learning model to answer the question: given certain features of a movie such as genre, duration, country, year, among others, how much will the worldwide gross income for the movie? We chose this question and this topic since it is a pop culture subject for which we think strong domain is not really needed. Also, it is important to note that the purpose of this project is not to build the most robust machine learning model, but be able to build one and measure its accuracy with the tools and techniques that we know how to use at the moment.

The data used in this project is a public domain data set of movies with attributes like genre, actors, year, country, among others, extracted from the publicly available website  https://www.imdb.com. 
Each row in the data set represents information of a movie, including the worldly gross income (in USD) and several other features (e.g., duration, number of reviews, avg vote score, etc.).

To answer the question mentioned, we will build a regression model. Before starting building our model, we will split the data in the following way: 75% training data and 25% test data. We will then perform some EDA (Exploratory Data Analysis) to asses if there are some features that do not have any correlation to the target value, or features that have very similar distributions, so we can remove them from our analysis. This will be shown by repeating plots of the numeric features vs the target value, and by histograms for the categorical features (the ones that do not need heavy wrangling).

Given that some of the features are numeric and others are categorical, some column transformations will be needed. Our initial approach will be to scale the numeric columns and apply One Hot Encoder on the categorical features. We plan to start using the RidgeCV algorithm to estimate the target value. For this algorithm the hyperparameter alpha will be tuned via cross-validation automatically. We will use ~ 15 folds because the data set is large and the cross-validation will take long (around 31,000 movies). We will use R-squared as a metric to measure how accurate the model is.

After having our hyperparameter tuned, we will fit the model on the entire training set, and evaluate it on the test data set. We will look at the overall accuracy metric and the R-squared score to asses the performance of the model. These values will be presented as a table in the final report.

The EDA performed and reports for the data set can be found [here](src/box_office_predictions_eda.md).

## Usage


## Dependencies


## License


# References