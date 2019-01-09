#!/usr/bin/env bash
source ./config.sh
grep WARN $log
./quickSummary.sh | head-tail 2 10 ; ./energySummary.sh | head-tail 2 10
