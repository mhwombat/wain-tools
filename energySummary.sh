#!/usr/bin/env bash
source ./config.sh
columns="round,avg. adult metabolism Δe,avg. adult pop. control Δe,avg. adult answer Δe,avg. adult mating Δe,avg. adult old age Δe,avg. adult net Δe"
./trendSummary.sh "$columns" | \
  sed 's/avg. //g; s/other adult/2/g; s/metabolism/metab/; s/answer/ans/; s/agreement/agr/g; s/pop. control/pop/; s/flirting/flirt/; s/mating/mate/; s/old age/old/' | \
  csvlook

