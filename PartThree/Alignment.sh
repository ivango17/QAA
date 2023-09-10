#!/bin/bash


#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB

conda activate QAA

/usr/bin/time -v STAR \
--runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartTwoB/15R1.P.fq.gz /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartTwoB/15R2.P.fq.gz \
--genomeDir /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartThree/MouseGenome \
--outFileNamePrefix /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartThree/15mouse.sam

/usr/bin/time -v STAR \
--runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartTwoB/17R1.P.fq.gz /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartTwoB/17R2.P.fq.gz \
--genomeDir /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartThree/MouseGenome \
--outFileNamePrefix /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartThree/17mouse.sam