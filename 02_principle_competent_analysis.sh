#!/bin/bash

## step1:
plink --file clean_order --sheep --pca 3 header tabs --out pca

## step2:
uniq breed.list | cut -f 1-2 | while read {i,j}; do sed -i "s/$j\t/$i\t/" pca.eigenvec ; done

## step3:
awk '{sum += $1;ay[NR] = $1} END {for (i = 1; i <= NR; i++) {print "PC"i, ay[i]/sum}}' pca.eigenval > pca_percentage.list
