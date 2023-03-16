#!/bin/sh

# update code
git pull origin main

# install Anaconda3
# wget -P /home/featurize/work https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash /home/featurize/work/Anaconda3-2020.02-Linux-x86_64.sh
source ~/.bashrc
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2 
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/menpo
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/simpleitk

# install cuDNN
# wegt -P /home/featurize/work https://developer.download.nvidia.com/compute/cudnn/secure/8.8.0/local_installers/11.8/cudnn-local-repo-ubuntu2004-8.8.0.121_1.0-1_amd64.deb?HCZfIgQCwDIO8chbWe90buCR4gmSmRnhrKwpyDCfY7yWoyRULDQuKzxJvwT1lPmFbyUjeMjOLhAm4sNt4rS352mvBYwpqpH7iVoxZW_1JugmSbzA85jxhDonOgDEe7q81L0Y-liZj6wZE61SgbsQcXciOvSHiegesehU98m5F1mNQi0TQvo5AQZiNgOt33dan1fNZrG3oUeREKJeNlFRcLtUuz6K&t=eyJscyI6IndlYnNpdGUiLCJsc2QiOiJsaW5rLmNzZG4ubmV0Lz90YXJnZXQ9aHR0cHMlM0ElMkYlMkZkZXZlbG9wZXIubnZpZGlhLmNvbSUyRmN1ZGEtODAtZ2EyLWRvd25sb2FkLWFyY2hpdmUifQ== 
# tar -vxzf /home/featurize/data/cudnn-linux-x86_64-8.8.0.121_cuda11-archive.tar.gz
cp /home/featurize/work/cudnn-linux-x86_64-8.8.0.121_cuda11-archive/include/cudnn.h /usr/local/cuda/include
cp /home/featurize/work/cudnn-linux-x86_64-8.8.0.121_cuda11-archive/lib/libcudnn* /usr/local/cuda/lib64
chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn* 

# install tensorflow_gpu
apt-get update -y
apt install nvidia-cuda-toolkit -y
apt install pip -y
# mkdir /home/featurize/work/.pip
# touch //home/featurize/work/.pip/pip.config
cp -r /home/featurize/work/.pip ~/
pip install tensorflow==2.11.0 -y

# install networkx
pip install networkx==2.0 -y

# install numpy
pip uninstall numpy -y
pip install numpy -y

# install tqdm
pip install tqdm==4.19.4 -y

# test environment
echo "============================================== test environment..."
conda --version
nvidia-smi
nvcc -V
python3 /home/featurize/work/tensorflow_gpu_check.py
echo "============================================== complete!"