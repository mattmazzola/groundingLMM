# GLaMM Demo Installation and Usage Guide 🚀

Welcome to the GLaMM Demo! This guide will walk you through the process of setting up and running the GLaMM Demo on your local GPU machine. Please ensure that your system meets the necessary requirements before proceeding.

## System Requirements
- GPU with at least 24 GB of memory
- Git and Git LFS installed
- [GLaMM environment](../docs/install.md)

## Installation Steps

### 1. Clone the GLaMM Repository
First, you need to clone the GLaMM repository from GitHub. Open your terminal and run the following command:

```bash
git clone https://github.com/mbzuai-oryx/groundingLMM.git
````

## 2. Download GLaMM Weights
To download the GLaMM model weights, you will need Git LFS. If you haven't installed Git LFS, you can do so by running:

```bash
git lfs install
```
Once Git LFS is installed, proceed to clone the GLaMM FullScope model:

```bash
git clone https://huggingface.co/MBZUAI/GLaMM-FullScope
```

For more information on the GLaMM FullScope model, visit [this link](https://huggingface.co/MBZUAI/GLaMM-FullScope).


### 3. Run the Demo

Navigate to the directory where the repository was cloned and run the demo using Python. Replace path_to_GLaMM_FullScope_model with the actual path to the downloaded GLaMM FullScope model:
```bash
python app.py --version "models/GLaMM-FullScope"
```

Once the demo is running, follow the on-screen instructions to open the demo dashboard in your web browser. The dashboard provides a user-friendly interface for interacting with the GLaMM model.
