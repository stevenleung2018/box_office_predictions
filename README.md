# Olympic Medal Hypothesis Testing

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

The analysis can be reproduced by following these steps:

1. Clone the GitHub repository and install the required [dependencies](#dependencies)
2. Navigate into the root directory of the cloned repository on your local machine
3. Run src/01_download_data.py by executing the following command line:

```
    python src/01_download_data.py --url="https://github.com/rfordatascience/tidytuesday/raw/master/data/2021/2021-07-27/olympics.csv" --saving_path="data/raw/olympics.csv"
```

4. Clean the downloaded data by running the script src/02_cleaning.py:

```
    python src/02_cleaning.py --reading_path="data/raw/olympics.csv" --saving_path="data/olympics_cleaned.csv"
```

5. Create the exploratory data analysis figures and tables:

```
    python src/03_EDA_olympics.py --reading_path="data/olympics_cleaned.csv" --saving_path="results"
```

6. Generate the HTML file displaying the EDA results:

```
    Rscript -e "rmarkdown::render('results/03_EDA.Rmd')"
```

7. Generate the hypothesis test figures and tables:

```
    Rscript src/04_htest.R --data="data/olympics_cleaned.csv" --saving_path="results"
```

8. Render the final HTML and markdown file of the final report:

```
    Rscript -e "rmarkdown::render('results/05_final_report.Rmd', 'all', output_dir='doc')"
```

## Dependencies

The Python environment required to run every python script can be found [here](https://github.com/UBC-MDS/olympic_medal_htest/blob/main/environment.yaml), or can be created using:

    - Python 3.9.6 and packages:
        - docopt=0.6.2
        - pandas=1.3.4
        - altair=4.1.0
        - altair_viewer=0.4.0
        - altair_saver=0.5.0
        
    - R 4.1.2 and libraries:
        - readr=2.1.0
        - tidyverse=1.3.1
        - here=1.0.1
        - knitr=1.36
        - pragma=2.3.3
        - broom=0.7.9
        - infer=1.0.0
        - docopt=0.7.1
        - kableExtra=1.3.4

## License


# References
