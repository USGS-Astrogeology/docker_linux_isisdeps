FROM fedora:25

RUN dnf install -y wget bzip2 ca-certificates

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.27-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh 

ENV PATH /opt/conda/bin:$PATH
RUN conda config --add channels conda-forge && \
    conda install anaconda-client && \
    conda env create usgs-astrogeology/isisdeps && \
    rm -rf /opt/conda/pkgs/*
ENV PATH /opt/conda/envs/isisdeps/bin:$PATH

ENTRYPOINT [ "/bin/bash", "-c", "--" ]


