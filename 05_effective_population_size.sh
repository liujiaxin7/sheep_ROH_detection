#!/bin/bash

## step1:
cut -f 1 clean.ped | sort | uniq | while read i
do
        grep "^$i[[:space:]]" clean.ped > ${i}.ped; cp clean.map ${i}.map
done


## step2:
cut -f 1 clean.ped | sort | uniq | while read i
do
        SNeP1.1 -ped outcome.ped -map outcome.map -ld -out ./${i}
done
