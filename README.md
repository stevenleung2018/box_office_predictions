# Box Office Predictions

-   authors: Steven Leung, Sam Quist, Brandon Lam, Ruben De la Garza Macias

Data analysis project for DSCI 522 (Data Science workflows); a course in the Master of Data Science program at the University of British Columbia.

## Introduction

For this project we will attempt to make a hypothesis test to answer the question: is the proportion of athletes younger than 25 that win a medal greater than the proportion of athletes of age 25 or older that win a medal? We chose this question and this topic since it is a pop culture subject for which we think strong domain is not really needed. It is important to note that the idea for this project is to be able to wrangle the data and test our hypothesis with the tools and techniques that we know how to use at the moment.

The data used in this project is a public domain data set of the olympics with information of athletes like nationality, sport/event, year, age, among others, extracted from the publicly available tidytuesday data sets. Each row in the data set represents information of an athlete competing in a certain event, including information of whether the athlete won a medal or not. The testing results and analysis will be presented in the final report.

To answer the question mentioned, we will perform a hypothesis test for the difference in proportions. First, we will perform an EDA (Exploratory Data Analysis) to get a general idea of how the data looks like and we will show this work in the EDA document for this project.

Given that we are going to perform a hypothesis, we defined our null and alternative hypothesis as follows:

- H0: the proportion of athletes younger than 25 that win a medal is equal to the proportion of athletes of age 25 or older that win a medal
- HA: the proportion of athletes younger than 25 that win a medal is greater than the proportion of athletes of age 25 or older that win a medal

We will use the simulation/permutation technique, and our test statistic will be the difference in proportions. We will check both the p-value and the place where the observed test statistic falls on the null distribution to determine if we can reject our null hypothesis or not. We will use a significance level of alpha = 0.05, and this will be a one-sided test.

The EDA performed and reports for the data set can be found in the src folder in this repo.

## Usage


## Dependencies


## License


# References