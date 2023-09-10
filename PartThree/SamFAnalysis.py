#!/usr/bin/env python

import argparse

def get_args():
    parser = argparse.ArgumentParser(description="This program iterates through a sam file and counts the number of mapped and unmapped reads.")
    parser.add_argument("-in", "--inputsam", help="What is the filepath for the sam file to be read", type=str)
    parser.add_argument("-out", "--outputtxt", help="What is the filepath for the summary file to be saved", type=str)
    return parser.parse_args()

args = get_args()

file = args.inputsam
output = args.outputtxt

numReads = 0
numUnmapped = 0
numMapped = 0


with open(file) as fh:

    for line in fh:
        if line[0] != "@":
            numReads += 1
            line = line.strip("\n")
            line = line.split("\t")
            flag = int(line[1])

            if(((flag & 4) != 4) and ((flag & 256) != 256)):
                numMapped += 1
            elif(((flag & 4) == 4) and ((flag & 256) != 256)):
                numUnmapped += 1
            else:
                continue

        else:
            continue


with open(output, "w") as out:

    out.write(f"Mapped: {numMapped}\nUnmapped: {numUnmapped}\nTotal: {numReads}")
