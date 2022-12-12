import os
import os.path
import datasets
from datasets import load_dataset


if __name__ == "__main__":
    output_path = "data"
    sep_token = "<GEN>"

    raw_datasets = load_dataset(
        "e2e_nlg",
    )

    for split in ["train", "validation", "test"]:
        with open(os.path.join(output_path, f"e2e_nlg_{split}.txt"), "w") as fp:
            for sample in raw_datasets[f"{split}"]:
                text = f"{sample['meaning_representation']}{sep_token}{sample['human_reference']}"
                fp.write(f"{text}\n")
