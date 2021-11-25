#!/usr/bin/env python
# coding: utf-8

# author: Steven Leung
# date: 2021-11-24
# project: Olympic Medal Hypothesis Testing
# milestone: 2

"""Generates the tables and figures of the EDA and saves to local path to be included in the EDA report.

Usage: 03_EDA_olympics.py --reading_path=<reading_path> --saving_path=<saving_path>

Options:
--reading_path=<reading_path>   Path (including filename) for the data file to be read 
--saving_path=<saving_path>     Path (folder location) to save the tables and figures
"""


from docopt import docopt
import pandas as pd
import os.path

import altair as alt

opt = docopt(__doc__)


def main(reading_path, saving_path):

    # Read data file.
    try:
        olympics_df = pd.read_csv(reading_path)
    except:
        print("Please ensure that the following file is available:\n", reading_path)

    # Let see what the age distribution looks like for all athletes.

    # Figure 1
    age_hist = alt.Chart(olympics_df).mark_bar().encode(
        alt.X('age:Q', scale=alt.Scale(zero=False)),
        alt.Y('count()'),
        tooltip=['age', 'count()']
    ).properties(
        width=300,
        height=300
    )
    try:
        age_hist.save(os.path.join(saving_path, "03_Figure1_age_hist.png"))
    except:
        print("Please check if the saving path is correct and is writable:\n",
              saving_path)

    numeric_cols_names = ['height',
                          'weight',
                          'year']

    # Figure 2
    numeric_cols_plot = alt.Chart(olympics_df).mark_point(
        opacity=0.3,
        size=10
    ).encode(
        alt.X('age', type='quantitative', scale=alt.Scale(zero=False)),
        alt.Y(alt.repeat('column'),
              type='quantitative',
              scale=alt.Scale(zero=False)),
        color='medal:N'
    ).properties(
        width=150,
        height=150
    ).repeat(
        column=numeric_cols_names
    )

    numeric_cols_plot.save(os.path.join(saving_path,
                                        "03_Figure2_numeric_cols_plot.png"))

    # Figure 3
    olympics_medals_df = olympics_df[olympics_df['medal'].notna()]
    numeric_cols_names = ['height',
                          'weight',
                          'year']

    numeric_cols_plot = alt.Chart(olympics_medals_df).mark_point(
        opacity=0.3,
        size=10
    ).encode(
        alt.X('age', type='quantitative', scale=alt.Scale(zero=False)),
        alt.Y(alt.repeat('column'),
              type='quantitative',
              scale=alt.Scale(zero=False)),
        color='medal:N'
    ).properties(
        width=150,
        height=150
    ).repeat(
        column=numeric_cols_names
    )

    numeric_cols_plot.save(os.path.join(saving_path,
                                        "03_Figure3_numeric_cols_plot.png"))

    age_medals_hist = alt.Chart(olympics_medals_df).mark_bar().encode(
        alt.X('age:Q', scale=alt.Scale(zero=False)),
        alt.Y('count()'),
        color=('medal'),
        tooltip=['age', 'medal', 'count()']
    ).properties(
        width=180,
        height=180
    ).facet(
        facet='medal:N',
        columns=3
    )
    age_medals_hist.save(os.path.join(saving_path,
                                      "03_Figure4_age_medals_hist.png"))

    # Figure 5
    cat_cols = ['sex',
                'season',
                'noc',
                'games',
                'city',
                'sport',
                'event']

    cat_plots = alt.Chart(olympics_medals_df).mark_boxplot().encode(
        x=alt.X('age', type='quantitative'),
        y=alt.Y(alt.repeat('row'), type='nominal'),
        color='medal:N',
        tooltip=['age']
    ).properties(
        height=300,
        width=150
    ).facet(
        facet='medal:N',
        columns=3
    ).repeat(
        row=cat_cols
    )

    cat_plots.save(os.path.join(saving_path,
                                "03_Figure5_cat_plots.png"))


if __name__ == "__main__":
    main(opt["--reading_path"], opt["--saving_path"])
