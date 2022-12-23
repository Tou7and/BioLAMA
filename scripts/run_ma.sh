#!/bin/bash

# Model definition
# MODEL=/home/t36668/projects/icd-transformers/recipes/cmai_bert/exp/cmaibert-base-cased-ep3
# MODEL_NAME=cmaibert
# MODEL=/home/t36668/projects/icd-transformers/recipes/cmai_bert/exp/cmai-biobert-base-cased
MODEL=dmis-lab/biobert-base-cased-v1.2
MODEL_NAME=biobert
# MODEL=./RoBERTa-base-PM-Voc/RoBERTa-base-PM-Voc-hf

# Task definition
TASK=wikidata # wikidata umls ctd
PROMPT_PATH=./data/${TASK}/prompts/manual.jsonl
TEST_PATH=./data/${TASK}/triples_processed/*/test.jsonl

OUTDIR=./exp/${MODEL_NAME}/${TASK}_manual

python ./BioLAMA/run_manual.py \
    --model_name_or_path ${MODEL} \
    --prompt_path ${PROMPT_PATH} \
    --test_path "${TEST_PATH}" \
    --init_method confidence \
    --iter_method none \
    --num_mask 10 \
    --max_iter 10 \
    --beam_size 5 \
    --batch_size 16 \
    --output_dir ${OUTDIR}

