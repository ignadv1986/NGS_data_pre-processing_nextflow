#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process remove_duplicates {
    publishDir path: 'results/deduplicated_bam', mode: 'copy'

    input:
    path sorted_bam

    output:
    path "${sorted_bam.baseName}.dedup.bam"
    path "${sorted_bam.baseName}.dedup.metrics.txt"

    script:
    """
    picard -XX:+UnlockExperimentalVMOptions -Dsamjdk.use_async_io=false -Dsamjdk.compression_level=1 \
        MarkDuplicates \
        I=${sorted_bam} \
        O=${sorted_bam.baseName}.dedup.bam \
        M=${sorted_bam.baseName}.dedup.metrics.txt \
        REMOVE_DUPLICATES=true \
        VALIDATION_STRINGENCY=SILENT
    """
}