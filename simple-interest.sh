#!/bin/bash
# simple-interest.sh - calculates simple interest
# Usage: ./simple-interest.sh principal rate(%) time(years)
# Example: ./simple-interest.sh 1000 5 2

if [ $# -ne 3 ]; then
  echo "Usage: $0 <principal> <rate_percent> <time_years>"
  exit 1
fi

p="$1"
r="$2"
t="$3"

# Basic validation (positive numbers)
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $p =~ $re ]] || ! [[ $r =~ $re ]] || ! [[ $t =~ $re ]]; then
  echo "Error: principal, rate, and time must be non-negative numbers."
  exit 1
fi

# Calculate simple interest: (p * r * t) / 100
si=$(echo "scale=2; ($p * $r * $t) / 100" | bc)
echo "Simple Interest: $si"

