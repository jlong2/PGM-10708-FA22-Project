#!/usr/bin/env bash
# Set bash to 'debug' mode, it will exit on :
# -e 'error', -u 'undefined variable', -o ... 'error in pipeline', -x 'print commands',
set -e
set -u
set -o pipefail

CUDA_VISIBLE_DEVICES=9 python ../text-generation/run_generation.py \
    --model_type=gpt2 \
    --model_name_or_path=exp/gpt2
