export CUDA_VISIBLE_DEVICES=1,2

cd ..
for inputf in $(ls data/eval/qa/*.json); do
    python eval_qa.py \
        --data_path $inputf \
        --model_name_or_path /mnt/ssd3/chunhui/research/llama2/Llama-2-13b-hf \
        --lora_name_or_path output/llama-13B/checkpoint \
        --output_log \
        --output_path output/ewc-lora-6B/qa-metric-llama-bf16.txt
done