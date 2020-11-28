FROM continuumio/miniconda3
RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge
COPY requirements-non-r.txt .
RUN conda create -p ./env --file requirements-non-r.txt -y
COPY requirements-r.txt .
RUN conda create -p ./env-r --file requirements-r.txt -y
