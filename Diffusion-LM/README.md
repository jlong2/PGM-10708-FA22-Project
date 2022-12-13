# Diffusion-LM Improves Controllable Text Generation

This repository is modified from https://github.com/XiangLi1999/Diffusion-LM 



-----------------------------------------------------
## Conda Setup:
```python 
conda install mpi4py
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
pip install -e improved-diffusion/ 
pip install -e transformers/
pip install spacy==3.2.4
pip install datasets==1.8.0 
pip install huggingface_hub==0.4.0 
pip install wandb
```

-----------------------------------------------------
## Train Diffusion-LM:

```cd improved-diffusion; mkdir diffusion_models;```

```python scripts/run_train.py --diff_steps 2000 --model_arch transformer --lr 0.0001 --lr_anneal_steps 200000  --seed 102 --noise_schedule sqrt --in_channel 16 --modality e2e-tgt --submit no --padding_mode pad --app "--predict_xstart True --training_mode e2e --vocab_size 821  --e2e_train ../datasets/e2e_data " --notes xstart_e2e```

```python train_run.py --experiment e2e-back --app "--init_emb {path_to_diff_lm} --n_embd 16 --learned_emb yes " --notes "full_multi_sqrt_16" --epoch 6 --bsz 10```

-------------------
## Decode Diffusion-LM:
mkdir out_gen

```python scripts/infill.py --model_path {path_to_diff_lm} --eval_task_ 'control_attribute' --use_ddim True --notes "tree_full_adagrad" --eta 1. --verbose pipe --init_samples {hyperparameter N}```

where $N$ is the number of samples for the initial state. If $N=0$, the result is equivalent to the original paper. For more details, please refer to Section $4.4$ in our report 
