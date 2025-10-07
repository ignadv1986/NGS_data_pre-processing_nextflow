#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process trimming {
    publishDir path: 'results/trimmed_reads', mode: 'copy'
    input:
    tuple val(sample_id), path(fastq_file1), path(fastq_file2)
    output:
    tuple val(sample_id), path("${sample_id}_R1_val_*.fq.gz"), path("${sample_id}_R2_val_*.fq.gz")
    script:
    """
    trim_galore --paired --quality 20 --length 30 --gzip ${fastq_file1} ${fastq_file2}
    """
}