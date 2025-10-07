#!/usr/bin/env nextflow //This indicates that it is a nextlow file
nextflow.enable.dsl=2

process bowtie2_build {
    publishDir 'results/bowtie2_index', mode: 'copy'
    input:
    path genome
    output:
    path("*.bt2"), emit: indexed_files
    script:
    def base = genome.baseName.replaceFirst(/\.fa$/, '')
    """
    bowtie2-build ${genome} ${base}
    """
}

process bowtie2_mapping {
    publishDir path: 'results/mapped_reads', mode: 'copy'
    input:
    tuple val(sample_id), path(trimmed_read1), path(trimmed_read2)
    tuple val(index_prefix), path(bt2_index_file_1), path(bt2_index_file_2), path(bt2_index_file_3), path(bt2_index_file_4), path(bt2_index_file_5), path(bt2_index_file_6)
    output:
    path("${sample_id}.sam")
    script:
    """
    bowtie2 -x $index_prefix -1 ${trimmed_read1} -2 ${trimmed_read2} -S ${sample_id}.sam
    """
}