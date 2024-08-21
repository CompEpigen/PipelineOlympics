#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
 ScatterFeatureRequirement: {}
 SubworkflowFeatureRequirement: {}
 StepInputExpressionRequirement: {}
 InlineJavascriptRequirement: {}

inputs:
  fastq1:
    type: File
  fastq2:
    type: File
  CROP:
    type: int
  HEADCROP:
    type: int
  adapters_file:
    type: File
  illuminaclip:
    type: string

steps:
  remove_r1_2end_6bp:
    run: "./tools/trimmomatic_single.cwl"
    in:
       fastq:
         source: fastq1
       CROP:
         source: CROP
       HEADCROP:
         source: HEADCROP
    out:
       - trimmed.fq

  remove_r2_start_15bp:
    run: "./tools/trimmomatic_single.cwl"
    in:
       fastq:
         source: fastq2
       CROP:
         source: CROP
       HEADCROP:
         source: HEADCROP
    out:
       - trimmed.fq

  trimmomatic:
    run: "trimmomatic.cwl"
    in: 
       fastq1:
         source: fastq1
       fastq2:
         source: fastq2
       adapters_file:
         source: adapters_file
       illuminaclip:
         source: illuminaclip
    out:
       - fastq1_trimmed
       - fastq2_trimmed   
       - fastq1_trimmed_unpaired
       - fastq2_trimmed_unpaired
       - trimmomatic_log

  read_pair_reconstruction:
    run: "./tools/TWGBS_read_pair_reconstruction.cwl"
    in:
      fastq1:
        source: trimmomatic/fastq1_trimmed
      fastq2: 
        source: trimmomatic/fastq2_trimmed
    out:
      - R1_OUT
      - R2_OUT
      - R1_unassigned
      - R2_unassigned
      - log

outputs: 
  fastq1_trimmed:
    type: File
    outputSource: trimmomatic/fastq1_trimmed
  fastq2_trimmed:
    type: File
    outputSource: trimmomatic/fastq2_trimmed
#  fastq1_trimmed_unpaired:
#    type: File
#    outputSource: trimmomatic/fastq1_trimmed_unpaired
#  fastq2_trimmed_unpaired:
#    type: File
#    outputSource: trimmomatic/fastq2_trimmed_unpaired
  trimmomatic_log:
    type: File
    outputSource: trimmomatic/trimmomatic_log
  R1_OUT: 
    type: File
    outputSource: read_pair_reconstruction/R1_OUT
  R2_OUT:
    type: File
    outputSource: read_pair_reconstruction/R2_OUT
  R1_unassigned:
    type: File
    outputSource: read_pair_reconstruction/R1_unassigned
  R2_unassigned:
    type: File
    outputSource: read_pair_reconstruction/R2_unassigned
  reconstruction_log:
    type: File
    outputSource: read_pair_reconstruction/log
