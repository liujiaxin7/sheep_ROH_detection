#!/bin/bash

## step1: ROH detection
plink --file clean --homozyg --homozyg-density 50 --homozyg-gap 1000 --homozyg-kb 500 --homozyg-snp 100 --homozyg-window-het 2 \
--homozyg-window-snp 50 --homozyg-window-threshold 0.05 --homozyg-window-missing 5 --out roh