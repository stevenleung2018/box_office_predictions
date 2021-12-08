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

#install mamba python distribution
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

#create python path
ENV PATH="/root/miniconda3/bin:${PATH}"

RUN conda config --append channels conda-forge
#install python packages
RUN conda install -y -c anaconda \
    docopt \
    pandas \
    altair \
    altair_viewer \
    altair_saver \
    pandoc
