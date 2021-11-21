# author: Brandon Lam
# date: 2021-11-20

"""Downloads csv data from a given URL to a local filepath.

Usage: download_data.py --url=<url> --saving_path=<saving_path>

Options:
--url=<url>                     URL for the data file to be downloaded 
--saving_path=<saving_path>     Path (including filename) to save the downloaded file
"""
  
from docopt import docopt
import os
import pandas as pd

opt = docopt(__doc__)

def main(url, saving_path): 
  
  data = pd.read_csv(url)

  try:
    data.to_csv(saving_path, index=False)
  except:
    os.makedirs(os.path.dirname(saving_path))
    data.to_csv(saving_path, index=False)

if __name__ == "__main__":
  main(opt["--url"], opt["--saving_path"])
