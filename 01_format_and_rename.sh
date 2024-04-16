#!/bin/bash

## step1: plink format
plink --bfile f1 --sheep --recode tab --out clean

## step2: modify FID and IID
cut -f 2 sample_info.txt | awk '{OFS = "\t"; ay[$0]++; printf("%s\t", $0); printf("%s", $0); printf("%02d\n", ay[$0])}' | paste - clean.ped | cut -f 3-4 --complement > a && mv a clean.ped

## step3: modify SNPID
awk '{OFS = "\t"; $2 = "chr"$1"_"$4; print $0}' clean.map > a && mv a clean.map
