cd ..
for inputf in $(ls data/eval/qa/*.json); do
    python eval_qa.py \
        --data_path $inputf \
        --model_name_or_path /mnt/ssd3/chunhui/research/llama2/Llama-2-70b-hf \
        --load_lora 0 \
        --lora_name_or_path output/ewc-lora-6B/checkpoint_no_ewc \
        --output_log \
        --output_path output/llama-70B/qa-metric.txt
done