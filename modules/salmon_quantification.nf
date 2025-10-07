#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process quantification {
    publishDir path: 'results/RNA-seq/quantification', mode: 'copy'
    input:
    path bam_file
    path salmon_index_dir
    output:
    path "*_quant"
    script:
    """
    sample_id=\$(basename ${bam_file} .bam)
    salmon quant \\
    -i ${salmon_index_dir} \\
    -l A \\
    -a ${bam_file} \\
    -o \${sample_id}_quant \\
    --threads 8 \\
    --gcBias \\
    --validateMappings
"""
}