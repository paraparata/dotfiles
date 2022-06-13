#!/bin/bash

# Args
SOURCE="$1"
OUTPUT="${2:-out.csv}"
START="${3:-0}"
END="${4:-}"

# Execute
if [ -z $SOURCE ]
then
  echo -e "File not found\n"
  echo "halp:"
  echo "sh csv-col-remover.sh {SOURCE} {OUTPUT, default: SOURCE} {START, default: 0} {END, default: ''}"
else
  python3 -c "
import sys, csv
w = csv.writer(sys.stdout)
for row in csv.reader(sys.stdin):
  w.writerow(row[$START:$END])
  " < $SOURCE > $OUTPUT 
  echo "cultered!"
fi

