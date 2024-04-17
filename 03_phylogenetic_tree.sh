#!/bin/bash

## step1:
plink --file clean --sheep --recode vcf-iid --out outcome

## step2:
run_pipeline.pl -Xmx30G -SortGenotypeFilePlugin -inputFile outcome.vcf -outputFile clean.sorted.vcf.gz -fileType VCF

## step3:
run_pipeline.pl -Xmx5G -importGuess clean.sorted.vcf.gz -ExportPlugin -saveAs supergene.phy -format Phylip_Inter

## step4:
FastTree -nt -gtr supergene.phy > fasttree.nwk
