# Import datasets from Kaggle API

# %%
import kagglehub

# Download latest version
path = kagglehub.dataset_download("swaptr/layoffs-2022")

print("Path to dataset files:", path)
# %%
