#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=compute               
#SBATCH --cpus-per-task=8                 
#SBATCH --mem=32GB 

/usr/bin/time fastqc -o "/projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartOneA" --casava "/projects/bgmp/shared/2017_sequencing/demultiplexed/15_3C_mbnl_S11_L008_R2_001.fastq.gz"