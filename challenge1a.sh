#!/usr/bin/env bash

pos=50
count=0

while IFS= read -r line; do
  dir=${line:0:1}      # 'L' or 'R'
  num=${line:1}        # the number part

  if [[ $dir == "L" ]]; then
    pos=$(( pos - num ))
  else
    pos=$(( pos + num ))
  fi

  pos=$(( (pos % 100 + 100) % 100 ))

  if (( pos == 0 )); then
    (( count++ ))
  fi
done < input.txt

echo "$count"

