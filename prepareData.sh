#!/bin/bash

mkdir -p docker-data

find ./data -type f -name "S*.txt" -print0 | xargs -0 sed -i '/^#/ d'

ls -1 ./data/S*PE_tabular.txt  | sed 's/\.[a-z]*//g' | xargs Rscript scripts/generateInserts.R
