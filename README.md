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

## Report

The rendered final report is located [here](https://github.com/UBC-MDS/olympic_medal_htest/tree/main/doc/05_final_report.html)

## Usage

The analysis can be reproduced by following these steps:

1. Clone the GitHub repository and install the required [dependencies](#dependencies)
2. Navigate into the root directory of the cloned repository on your local machine
3. Run the `Make` file with the following command:

```
make all
```

The local repository can be reset to the initial cloned state by running:

```
make clean
```


## Dependencies

The Python environment required to run every python script can be found [here](https://github.com/UBC-MDS/olympic_medal_htest/blob/main/environment.yaml), or can be created using:

    - Python 3.9.6 and packages:
        - docopt=0.6.2
        - pandas=1.3.4
        - altair=4.1.0
        - altair_viewer=0.4.0
        - altair_saver=0.5.0
        - pandoc=2.16.2
        
    - R 4.1.2 and libraries:
        - readr=2.1.0
        - tidyverse=1.3.1
        - here=1.0.1
        - knitr=1.36
        - pracma=2.3.3
        - broom=0.7.9
        - infer=1.0.0
        - docopt=0.7.1
        - kableExtra=1.3.4

## License

The Olympic Medal H-test project is available under the MIT license. See [LICENSE](https://github.com/UBC-MDS/olympic_medal_htest/blob/main/LICENSE) for more information.

# References

Bray, Andrew, Chester Ismay, Evgeni Chasnovski, Simon Couch, Ben Baumer, and Mine Cetinkaya-Rundel. 2021. Infer: Tidy Statistical Inference. https://CRAN.R-project.org/package=infer.

de Jonge, Edwin. 2020. Docopt: Command-Line Interface Specification Language. https://CRAN.R-project.org/package=docopt.

McKinney, Wes. 2010. “Data Structures for Statistical Computing in Python.” In Proceedings of the 9th Python in Science Conference, edited by Stéfan van der Walt and Jarrod Millman, 51–56.

Python Core Team. 2019a. Python: A dynamic, open source programming language. Python Software Foundation. https://www.python.org/.

———. 2019b. Python: A dynamic, open source programming language. Python Software Foundation. https://www.python.org/.

R Core Team. 2021. R: A Language and Environment for Statistical Computing. Vienna, Austria: R Foundation for Statistical Computing. https://www.R-project.org/.

Robinson, David, Alex Hayes, and Simon Couch. 2021. Broom: Convert Statistical Objects into Tidy Tibbles. https://CRAN.R-project.org/package=broom.

VanderPlas, Jacob, Brian E Granger, Jeffrey Heer, Dominik Moritz, Kanit Wongsuphasawat, Arvind Satyanarayan, Eitan Lees, Ilia Timofeev, Ben Welsh, and Scott Sievert. 2018. “Altair: Interactive Statistical Visualizations for Python.” Journal of Open Source Software 3 (32): 1057.

Wickham, Hadley, Mara Averick, Jennifer Bryan, Winston Chang, Lucy D’Agostino McGowan, Romain François, Garrett Grolemund, et al. 2019. “Welcome to the tidyverse.” Journal of Open Source Software 4 (43): 1686. https://doi.org/10.21105/joss.01686.

Xie, Yihui. 2021. Knitr: A General-Purpose Package for Dynamic Report Generation in r. https://yihui.org/knitr/.

Zhu, Hao. 2021. kableExtra: Construct Complex Table with ’Kable’ and Pipe Syntax. https://CRAN.R-project.org/package=kableExtra.

Singh, Dr Preet Deep. 2021. “Olympic Medals: Matter of Nerves.” Available at SSRN 3901321. https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3901321

Elmenshawy, Ahmed R, Daniel R Machin, and Hirofumi Tanaka. 2015. “A Rise in Peak Performance Age in Female Athletes.” Age 37 (3): 1–8. https://link.springer.com/article/10.1007/s11357-015-9795-8