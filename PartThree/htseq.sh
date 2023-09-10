#!/bin/bash


#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB

conda activate QAA

/usr/bin/time -v htseq-count --stranded=yes 15mouse.samAligned.out.sam ./EnsemblFiles/Mus_musculus.GRCm39.110.gtf >> 15_syes_htseq
/usr/bin/time -v htseq-count --stranded=reverse 15mouse.samAligned.out.sam ./EnsemblFiles/Mus_musculus.GRCm39.110.gtf >> 15_sreverse_htseq
/usr/bin/time -v htseq-count --stranded=yes 17mouse.samAligned.out.sam ./EnsemblFiles/Mus_musculus.GRCm39.110.gtf >> 17_syes_htseq
/usr/bin/time -v htseq-count --stranded=reverse 17mouse.samAligned.out.sam ./EnsemblFiles/Mus_musculus.GRCm39.110.gtf >> 17sreverse_htseq