#!/bin/bash
export CUDA_VISIBLE_DEVICES=4,5,6

cd ..

task_name=$(basename $inputf .json)
METRIC="rouge"
if [[ $task_name == "obj_move_path_test" ]]; then
    METRIC="lcs"
fi
python /mnt/ssd3/chunhui/elsie/proxy-tuning/eval/world_model_gen_llama.py \
    --val_file data/eval/gen/obj_move_path_test.json \
    --model_name_or_path /mnt/ssd3/chunhui/research/llama2/Llama-2-70b-hf \
    --expert_model_name_or_path /mnt/ssd3/chunhui/research/llama2/Llama-2-13b-hf \
    --metric_name_or_path lcs \
    --lora_name_or_path /mnt/ssd3/chunhui/elsie/world-model-for-language-model/output/llama-13B/checkpoint \
    --max_tgt_len 256 \
    --per_device_eval_batch_size 1 \
    --output_log 1 \
    --output_path output/llama-gen-test/llama-13b-original.txt
