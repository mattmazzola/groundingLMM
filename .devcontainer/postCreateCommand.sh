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

conda install -y -c pytorch pytorch=2.0.1
conda install -y -c nvidia cuda-compiler

pip install --upgrade pip setuptools wheel
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
