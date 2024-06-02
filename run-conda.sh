# ----------------------------------------------------------------------------- install conda
brew install --cask miniconda
conda update conda

conda init zsh
conda init bash
exit # restart shell

conda config --set auto_activate_base false # disable auto-activation
conda config --env --set subdir osx-64 # emulate x86_64

# ----------------------------------------------------------------------------- start
conda activate base

# see: https://blog.balasundar.com/install-older-versions-of-python-using-miniconda-on-mac-m1
conda create --yes --name noodle-retrieval python=3.6.12 anaconda
conda activate noodle-retrieval

# setuptools requirements (order matters)
pip install 'pyqtwebengine<5.13'
pip install 'pyqt5<5.13'
pip install pyls-black
pip install --no-deps ruamel.yaml # kind of a hack

# allennlp requirements (order matters)
pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade wheel
pip install --upgrade Cython
pip install think --no-build-isolation
pip install spacy --no-build-isolation
pip install jsonnet --no-build-isolation

# project requirements
pip install allennlp==1.2.2 --no-build-isolation
pip install blingfire==0.1.7
pip install PyYAML==5.4
pip install transformers==3.5.1
pip install --find-links https://download.pytorch.org/whl/torch_stable.html torch==1.6.0
pip install overrides

# convenience
pip install black isort flake8 mypy
pip install numpy pandas matplotlib seaborn

# ----------------------------------------------------------------------------- stop
conda deactivate
conda remove --yes --name noodle-retrieval --all
conda env list
