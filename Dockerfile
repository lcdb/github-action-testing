FROM continuumio/miniconda3
RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge
RUN conda create -p ./env --file requirements-non-r.txt -y
