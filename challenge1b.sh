#!/usr/bin/env bash

pos=50
count=0

while IFS= read -r line; do
  dir=${line:0:1}       # L or R
  n=${line:1}           # distance

  if [[ $dir == "R" ]]; then
    if (( pos == 0 )); then
      first=100
    else
      first=$(( (100 - pos) % 100 ))
      (( first == 0 )) && first=100
    fi
  else  # L
    if (( pos == 0 )); then
      first=100
    else
      first=$(( pos % 100 ))
      (( first == 0 )) && first=100
    fi
  fi

  if (( n >= first )); then
    count=$(( count + 1 + (n - first) / 100 ))
  fi

  if [[ $dir == "R" ]]; then
    pos=$(( (pos + n) % 100 ))
  else
    pos=$(( (pos - n) % 100 ))
    pos=$(( (pos + 100) % 100 ))
  fi

done < input.txt

echo "$count"

