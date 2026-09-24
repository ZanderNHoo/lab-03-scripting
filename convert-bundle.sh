#!/bin/bash
set -euo pipefail
curl -s https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz -o lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz
awk 'NR > 1 && !/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv
tr '\t' ',' < cleaned.tsv > cleaned.csv
ROWS=$(tail -n +2 cleaned.csv | wc -l)
echo "Data rows remaining: $ROWS"
tar -czf converted-archive.tar.gz cleaned.csv