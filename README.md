# NGS_data_pre-processing_nextflow
Nextflow pipeline that uses a custom Docker container for the pre-processing of NGS-generated data generated from **CUT&RUN**, **RNA-seq**, and **ATAC-seq** experiments.
## Overview
This pipeline performs quality control, trimming, alignment, and quantification steps tailored to each assay type. It is designed to be modular, reproducible, and portable across computing environments.

Key features include:

- Modular Nextflow workflow with assay-specific configurations
- Containerized environment with all dependencies via Docker
- Support for CUT&RUN, RNA-seq, and ATAC-seq data preprocessing
- Quality control steps including FastQC and assay-specific QC metrics
- Alignment using STAR (RNA-seq) and Bowtie2 (CUT&RUN, ATAC-seq)
- Quantification for RNA-seq using Salmon

## Requisites
- [Nextflow](https://www.nextflow.io/)
- [Docker](https://www.docker.com/)
- 
## Instructions
