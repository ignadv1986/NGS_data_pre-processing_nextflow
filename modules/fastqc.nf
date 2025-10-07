#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process fastqc_raw {
    publishDir path: 'results/fastqc', mode: 'copy'
    input:
    path fastq_files
    output:
    path "*.zip"
    path "*.html"
    script:
    """
    fastqc -q ${fastq_files}
    """
}