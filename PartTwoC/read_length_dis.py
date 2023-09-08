#!/usr/bin/env python

import matplotlib.pyplot as plt
import argparse
import numpy as np
import gzip

def get_args():
    parser = argparse.ArgumentParser(description="This program generates a histogram of read lengths for a fastq.gz file.")
    parser.add_argument("-R1", "--filefw", help="What is the filepath for the fw file to be read", type=str)
    parser.add_argument("-R2", "--filerv", help="What is the filepath for the rv file to be read", type=str)
    parser.add_argument("-o1", "--output1", help="What will the plot for the first file be called?", type=str)
    parser.add_argument("-o2", "--output2", help="What will the plot for the second file be called?", type=str)
    parser.add_argument("-os", "--summaryfile", help="What will the summary file be called?", type=str)
    parser.add_argument("-off", "--filestarts", help="What will outputfiles contain?", type=str)
    return parser.parse_args()

args = get_args()
R1 = args.filefw
R2 = args.filerv
O1 = args.output1
O2 = args.output2
summary = args.summaryfile
OF = args.filestarts

R1Lengths = []
R2Lengths = []

R1LineCounter = 0
R2LineCounter = 0


with gzip.open(R1, "rt") as R1:

    for line in R1:

        line = line.strip()
        R1LineCounter += 1

        if R1LineCounter % 4 == 2:

            R1Lengths.append(len(line))


with gzip.open(R2, "rt") as R2:

    for line in R2:

        line = line.strip()
        R2LineCounter += 1

        if R2LineCounter % 4 == 2:

            R2Lengths.append(len(line))


plt.title(f"Distribution of read lengths for {OF}R1")
plt.xlabel("Read Length")
plt.ylabel("Frequency")

plt.hist(R1Lengths)
plt.savefig(O1)


plt.title(f"Distribution of read lengths for {OF}R2")
plt.xlabel("Read Length")
plt.ylabel("Frequency")

plt.hist(R2Lengths)
plt.savefig(O2)


with open(summary, "w") as s:
    s.write(f"Reads for R1: {R1LineCounter/4}")
    s.write(f"Reads for R2: {R2LineCounter/4}")