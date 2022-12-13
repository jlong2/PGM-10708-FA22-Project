GPT-2 Baseline
===

## Prepare data

The script `prepare_e2e_nlg.py` can be used to prepare the training data. It loads the dataset from Hugging Face and then concatenates the prompt and text.

## Fine-tune

Please use `run_clm_e2e_nlg.sh` to fine-tune a pre-trained GPT-2 model on our data. We used two GPUs with 24GB VRAM each.

## Decode

Please use `test_nlg.py` to run generation for the test dataset. Prompts are stored in a file `target_attribute.json`, in which each line is a json object.
