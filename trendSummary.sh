#!/usr/bin/env bash
source ./config.sh
colNames=$1

grep Summary $log | \
    sed 'N; N; N; N; s/\n[^,]*Summary - /,/g' | \
    sed 's/.*\t\([0-9]*\)\tSummary - /round=\1,/' | \
    awk -f trendSummary.awk "vars=$colNames"
