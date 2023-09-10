#!/bin/bash


#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB

conda activate QAA

/usr/bin/time -v STAR \
--runThreadN 8 \
--readFilesCommand zcat \
--runMode genomeGenerate \
--genomeDir /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartThree/MouseGenome \
--genomeFastaFiles /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartThree/EnsemblFiles/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/ianvango/bioinfo/Bi623/QAA/PartThree/EnsemblFiles/Mus_musculus.GRCm39.110.gtf