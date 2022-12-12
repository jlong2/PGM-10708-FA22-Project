#!/usr/bin/env bash
# Set bash to 'debug' mode, it will exit on :
# -e 'error', -u 'undefined variable', -o ... 'error in pipeline', -x 'print commands',
set -e
set -u
set -o pipefail

CUDA_VISIBLE_DEVICES=8,9 python run_clm.py \
    --model_name_or_path gpt2 \
    --train_file data/e2e_nlg_train.txt \
    --validation_file data/e2e_nlg_validation.txt \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 8 \
    --do_train \
    --do_eval \
    --output_dir exp/gpt2 \
    --learning_rate 5e-5 \
    --num_train_epochs 20 \
    --warmup_steps 1000 \
    --save_steps 200 \
    --save_total_limit 1 \
    --fp16 \
    --evaluation_strategy steps \
    --eval_steps 200 \
    --load_best_model_at_end \
    --metric_for_best_model eval_loss \
    --greater_is_better false
