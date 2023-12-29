git config --global safe.directory '*'
git config --global core.editor "code --wait"
git config --global pager.branch false

# Set AZCOPY concurrency to auto
echo "export AZCOPY_CONCURRENCY_VALUE=AUTO" >> ~/.zshrc
echo "export AZCOPY_CONCURRENCY_VALUE=AUTO" >> ~/.bashrc

# Add dotnet to PATH
echo 'export PATH="$PATH:$HOME/.dotnet"' >> ~/.zshrc
echo 'export PATH="$PATH:$HOME/.dotnet"' >> ~/.bashrc

# Activate conda by default
echo "source /home/vscode/miniconda3/bin/activate" >> ~/.zshrc
echo "source /home/vscode/miniconda3/bin/activate" >> ~/.bashrc

# Use glamm environment by default
echo "conda activate glamm" >> ~/.zshrc
echo "conda activate glamm" >> ~/.bashrc

# Activate conda on current shell
source /home/vscode/miniconda3/bin/activate

# Create and activate glamm environment
conda create -y -n glamm -c conda-forge python=3.10
conda activate glamm

pip install --upgrade pip

conda install -y -c nvidia cuda-nvcc=11.7
# conda install -y -c pytorch pytorch=2.0.1
conda install -y -c pytorch -c nvidia pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7

# Install OpenMMLab Computer Vision
pip install -U openmim
# mim install mmcv-full
mim install "mmcv <= 1.5.0"
# mim install "mmcv-full <= 1.5.0"

pip install -r requirements.txt

export PYTHONPATH="./:$PYTHONPATH"

# Install Amulet
pip install -U amlt --index-url https://msrpypi.azurewebsites.net/stable/leloojoo

# Dowload pretrained LLaVA models
mkdir -p models
cd models

git clone https://huggingface.co/MBZUAI/GLaMM-FullScope

cd ..

python --version
nvcc --version

echo "postCreateCommand.sh completed!"
