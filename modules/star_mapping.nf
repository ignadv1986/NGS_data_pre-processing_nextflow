#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process star_mapping {
    publishDir 'results/RNA-seq/mapping', mode: 'copy'
    input:
    tuple val(sample_id), path(read1), path(read2)
    path indexed_genome
    output:
    path "${sample_id}.bam"
    script:
    """
    STAR --runThreadN 8 \\
         --genomeDir ${indexed_genome} \\
         --readFilesIn ${read1} ${read2} \\
         --readFilesCommand zcat \\
         --outSAMtype BAM SortedByCoordinate \\
         --outFileNamePrefix ${sample_id}_

    mv ${sample_id}_Aligned.sortedByCoord.out.bam ${sample_id}.bam
    """
}