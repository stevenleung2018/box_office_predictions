# author: Steven Leung
# date: 2021-11-24
# project: Olympic Medal Hypothesis Testing
# milestone: 2

"""Cleans the data in the input csv file from a local path and ave as another file to a local path.

Usage: 02_cleaning.py --reading_path=<reading_path> --saving_path=<saving_path>

Options:
--reading_path=<reading_path>   Path (including filename) for the data file to be read 
--saving_path=<saving_path>     Path (including filename) to save the cleaned file
"""
  
from docopt import docopt
import os
import pandas as pd

opt = docopt(__doc__)

def main(reading_path, saving_path): 
  
  df_raw = pd.read_csv(reading_path)

  df_cleaned = df_raw[df_raw['age'].notna()]
    
  try:
    df_cleaned.to_csv(saving_path, index=False)
  except:
    os.makedirs(os.path.dirname(saving_path))
    df.to_csv(saving_path, index=False)

if __name__ == "__main__":
  main(opt["--reading_path"], opt["--saving_path"])
