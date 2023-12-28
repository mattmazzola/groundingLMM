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
conda create -y -n=glamm python=3.10
conda activate glamm

# Install Nvidia Cuda Compiler
conda install -y -c nvidia cuda-compiler

pip install -r requirements.txt

export PYTHONPATH="./:$PYTHONPATH"

# Install Amulet
pip install -U amlt --index-url https://msrpypi.azurewebsites.net/stable/leloojoo

echo "postCreateCommand.sh completed!"
