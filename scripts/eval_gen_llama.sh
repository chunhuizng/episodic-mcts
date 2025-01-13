export CUDA_VISIBLE_DEVICES=1,2,3,4

cd ..
for inputf in $(ls data/eval/gen/*.json); do
    task_name=$(basename $inputf .json)
    METRIC="rouge"
    if [ $task_name == "obj_move_path" ]; then
        METRIC="lcs"
    fi
    python eval_gen.py \
        --val_file $inputf \
        --model_name_or_path /mnt/ssd3/chunhui/research/llama2/Llama-2-13b-hf \
        --metric_name_or_path $METRIC \
        --lora_name_or_path output/llama-13B/checkpoint \
        --max_tgt_len 256 \
        --per_device_eval_batch_size 2 \
        --output_log 1 \
        --output_path output/llama-13B/gen-metric-llama-13b-test.txt
done