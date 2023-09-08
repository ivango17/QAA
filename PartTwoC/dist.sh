#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=compute               
#SBATCH --cpus-per-task=8                 
#SBATCH --mem=32GB 

conda activate base

/usr/bin/time ./read_length_dis.py -R1 "../PartTwoB/15R1.P.fq.gz" -R2 "../PartTwoB/15R1.P.fq.gz" -o1 "./15R1.png" -o2 "./15R2.png" -os "./15.summary" -off "15"

/usr/bin/time ./read_length_dis.py -R1 "../PartTwoB/17R1.P.fq.gz" -R2 "../PartTwoB/17R1.P.fq.gz" -o1 "./17R1.png" -o2 "./17R2.png" -os "./17.summary" -off "17"