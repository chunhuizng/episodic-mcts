export CUDA_VISIBLE_DEVICES=0 

cd ..
python run_no_ewc.py \
	--train_file "1 data/train/train_plan_gen.json 0.7 data/train/train_act_recog.json 1 data/train/train_count.json 1 data/train/train_obj_move.json" \
	--fisher_matrix_path /mnt/ssd3/chunhui/elsie/world-model-for-language-model/fisher-matrix/fisher-matrix-6B \
	--model_name_or_path /mnt/ssd3/chunhui/research/llama2/Llama-2-13b-hf \
	--per_device_train_batch_size 5 \
	--gradient_accumulation_steps 4 \
	--lr 8e-5 \
	--output_dir output/llama-13B/checkpoint \
	--num_epochs 5 \
	--ewc_lambda 2
