#!/bin/sh

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
# featurize dataset download 9c1db7c5-ad71-4980-97ae-3986437e61c2
# tar -vxzf /home/featurize/data/cudnn-linux-x86_64-8.8.0.121_cuda11-archive.tar.gz
cp /home/featurize/work/cudnn-linux-x86_64-8.8.0.121_cuda11-archive/include/cudnn.h /usr/local/cuda/include
cp /home/featurize/work/cudnn-linux-x86_64-8.8.0.121_cuda11-archive/lib/libcudnn* /usr/local/cuda/lib64
chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn* 

# install tensorflow_gpu
apt-get update -y
apt install pip -y
cp -r /home/featurize/work/.pip ~/
pip install tensorflow==2.11.0

# install networkx
pip install networkx==2.0

# install numpy
pip install numpy==1.13.3

# install tqdm
pip install tqdm==4.19.4

