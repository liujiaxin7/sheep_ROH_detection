#!/bin/bash

## step1:
cut -f 1 clean.ped | sort | uniq | while read i
do
        grep "^$i[[:space:]]" clean.ped > ${i}.ped; cp clean.map ${i}.map
done

## step2:
cut -f 1 clean.ped | sort | uniq | while read i
do
        plink  --file ${i} --sheep --recode vcf-iid --out ${i}
done

## step3:
cut -f 1 clean.ped | sort | uniq | while read i
do
        PopLDdecay  -InVCF  ${i}.vcf  -OutStat ${i}_lddecay
done

## step4:
find *.gz | awk -F "_" '{OFS = "\t"; print $0, $1}' > pop.list

## step4:
perl Plot_MutiPop.pl -inList pop.list -output Fig
