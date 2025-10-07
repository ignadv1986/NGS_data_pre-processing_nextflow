#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process sam_to_bam {
    publishDir path: 'results/bam_files', mode: 'copy'
    input:
    path sam_file
    output:
    path("*.sorted.bam")
    script:
    """
    samtools view -bS ${sam_file} | samtools sort -o ${sam_file.baseName}.sorted.bam
    """
}