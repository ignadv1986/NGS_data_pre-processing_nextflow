#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process fastqc_trimmed {
    publishDir path: 'results/fastqc_trimmed', mode: 'copy'
    input:
    path(trimmed_files)
    output:
    path("*.zip")
    path("*.html")
    script:
    """
    fastqc -q ${trimmed_files}
    """
}