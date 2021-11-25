#!/usr/bin/env python
# coding: utf-8

# THIS IS AN INCOMPLETE SCRIPT FOR TESTING ONLY.

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
import io

import altair as alt

opt = docopt(__doc__)

def main(reading_path, saving_path):

    # Read data file.
    try:
        olympics_df = pd.read_csv(reading_path)
    except:
        print("Please ensure that the following file is available:\n", reading_path)

    try:
        text_file = open(os.path.join(saving_path, "03_01_df-info.txt"), "w")
    except:
        print("Please check if the saving path is correct and is writable:\n", saving_path)

    buffer = io.StringIO()
    olympics_df.info(buf=buffer)
    text_file.write(buffer.getvalue())
    text_file.close()

    pd.DataFrame(olympics_df.shape).to_csv(os.path.join(saving_path, "03_02_df_shape.csv"))

    # Let see what the age distribution looks like for all athletes.

    age_hist = alt.Chart(olympics_df).mark_bar().encode(
        alt.X('age:Q', scale=alt.Scale(zero=False)),
        alt.Y('count()'),
        tooltip=['age', 'count()']
    ).properties(
        width=300,
        height=300
    )
    age_hist.save(os.path.join(saving_path, "03_03_age_hist.png"))

if __name__ == "__main__":
  main(opt["--reading_path"], opt["--saving_path"])