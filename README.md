Here's your revised version of the README:

# Scaling Episodic Grounding by Post-Training on MCTS Behavior Data

Official implementation for "Scaling Episodic Grounding by Post-Training on MCTS Behavior Data". Post-training agentic LLMs (instruction tuning, knowledge distillation, and DPO on different LLMs across 3B, 8B, and 70B) on MCTS-sampled data from physical simulator to conduct planning.


## Installation

Install the required dependencies:
```bash
pip install -r requirements.txt
```

## MCTS-based Embodied Experience Collection


The MCTS-sampled training data and evaluation data are available in `/data/train` and `/data/eval`, respectively.

<details>
<summary><strong>Dataset Statistics</strong></summary>

### Training Data
| Category | Sample Size |
|----------|-------------|
| Successful Trajectories | 2000 |
| Failed Trajectories | 2000 |
| State-Action Pairs | 5000 |

### Evaluation Data
| Category | Sample Size |
|----------|-------------|
| Zero-shot Planning | 500 |
| Few-shot Planning | 500 |
| Complex Goal Planning | 300 |
| Multi-step Reasoning | 400 |
</details>

## Training & Evaluation

### Training
For single GPU training (e.g., with 8B model):
```bash
bash scripts/train_single_gpu.sh
```

For distributed training, first configure accelerate:
```bash
accelerate config --config_file accelerate_config.json
```
Then run:
```bash
bash scripts/train_multi_gpu.sh
```

### Evaluation
For evaluating planning capabilities:
```bash
bash scripts/eval_planning.sh
```

For evaluating reasoning abilities:
```bash
bash scripts/eval_reasoning.sh
```

Results will be saved in `outputs/metrics/`.
