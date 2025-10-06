FROM continuumio/miniconda3

RUN conda install -y -c bioconda -c conda-forge \
    python=3.10 \
    fastqc \
    trim-galore \
    star \
    salmon \
    picard \
    bowtie2 \
    samtools \
    pigz \
    gzip \
    unzip \
    && conda clean -afy

ENV PATH=/opt/conda/bin:$PATH

WORKDIR /data

ENTRYPOINT ["/bin/bash"]

