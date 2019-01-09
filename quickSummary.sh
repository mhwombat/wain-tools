#!/usr/bin/env bash
source ./config.sh
columns="round,avg. age,avg. adult energy,avg. classifier num models,avg. predictor num models,avg. pop. size,avg. action err"
./trendSummary.sh "$columns" | sed 's/avg. //g; s/classifier/cl./g; s/predictor/pr./g; s/total flirted/flirted/' | csvlook
