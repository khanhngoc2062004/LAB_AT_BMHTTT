#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "=== PAPER REPLICATION DEMO ==="

for file in \
  data/raw/interviews.csv \
  data/processed/open_codes.csv \
  data/processed/axial_codes.csv \
  data/processed/selective_coding.md \
  results/knowledge_taxonomy.csv \
  results/motivation_analysis.csv
do
  if [ ! -s "$file" ]; then
    echo "FAIL: Missing or empty $file"
    exit 1
  fi
done

echo "PASS: Required files exist"

echo
echo "=== DATASET STATISTICS ==="

echo "Interview statements:"
tail -n +2 data/raw/interviews.csv | wc -l

echo "Open codes:"
tail -n +2 data/processed/open_codes.csv | wc -l

echo "Axial categories:"
tail -n +2 data/processed/axial_codes.csv \
  | cut -d, -f3 | sort -u | wc -l

echo
echo "=== KNOWLEDGE TAXONOMY ==="
tail -n +2 results/knowledge_taxonomy.csv \
  | cut -d, -f3 | sort | uniq -c

echo
echo "=== MOTIVATION ANALYSIS ==="
tail -n +2 results/motivation_analysis.csv \
  | cut -d, -f3 | sort | uniq -c

echo
echo
echo "=== DATA VALIDATION ==="

awk -F, '
NR==FNR {
  if (FNR>1) ids[$1]=1
  next
}
FNR>1 && !($1 in ids) {
  print "FAIL: Unknown interview ID " $1
  errors++
}
END {
  if (errors==0)
    print "PASS: All open codes match interview IDs"
  else
    exit 1
}
' data/raw/interviews.csv data/processed/open_codes.csv

echo
echo "=== DUPLICATE ID CHECK ==="

for file in \
  data/raw/interviews.csv \
  data/processed/open_codes.csv \
  data/processed/axial_codes.csv
do
  duplicates=$(tail -n +2 "$file" | cut -d, -f1 | sort | uniq -d)

  if [ -n "$duplicates" ]; then
    echo "FAIL: Duplicate IDs in $file"
    echo "$duplicates"
    exit 1
  fi

  echo "PASS: No duplicate IDs in $file"
done


echo
echo "=== ORIGINAL STUDY: SYNTHETIC WORKFLOW DEMO ==="
echo "NOTE: Previous interview/coding files are synthetic examples."
echo "NOTE: They are NOT the original 13 interview transcripts."

echo
echo "=== RQ1: EXTERNAL SURVEY EXTENSION ==="

ruby replication/extension/analyze_rq1.rb

echo
echo "=== RQ1 RESULTS ==="

cat replication/extension/rq1_learning_channels.csv

echo
echo "=== RESEARCH COMPARISON ==="

cat replication/analysis/rq1_comparison.md

echo
echo "=== DEMO COMPLETED ==="

