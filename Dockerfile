#Use rocker/tidyverse as base image
FROM rocker/tidyverse:4.1

#install necessary R packages
RUN apt-get update -qq && apt-get --no-install-recommends install \
  && install2.r --error \
  --deps TRUE \
  readr \
  here \
  knitr \
  pracma \
  broom \
  infer \
  docopt \
  kableExtra

#install miniconda3 python distribution
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

#create python path
ENV PATH="/root/miniconda3/bin:${PATH}"

#add necessary conda-forge channel
RUN conda config --append channels conda-forge

#install python packages
RUN conda install -y -c anaconda \
    docopt=0.6.* \
    pandas=1.3.* \
    altair=4.1.* \
    altair_viewer=0.4.* \
    altair_saver=0.5.*

#install pandoc correctly
RUN conda install -c conda-forge pandoc=2.16.*