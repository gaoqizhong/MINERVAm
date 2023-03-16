#!/bin/bash

# create python2.7 environment by Anaconda
conda create --name python2.7 python=2.7 -y
conda activate python2.7
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/

# install Anaconda
# wget -P /home/featurize/work https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
# bash /home/featurize/work/Anaconda3-2020.02-Linux-x86_64.sh

# install cuDNN
# wegt -P /home/featurize/work https://developer.download.nvidia.com/compute/cudnn/secure/8.8.0/local_installers/11.8/cudnn-local-repo-ubuntu2004-8.8.0.121_1.0-1_amd64.deb?HCZfIgQCwDIO8chbWe90buCR4gmSmRnhrKwpyDCfY7yWoyRULDQuKzxJvwT1lPmFbyUjeMjOLhAm4sNt4rS352mvBYwpqpH7iVoxZW_1JugmSbzA85jxhDonOgDEe7q81L0Y-liZj6wZE61SgbsQcXciOvSHiegesehU98m5F1mNQi0TQvo5AQZiNgOt33dan1fNZrG3oUeREKJeNlFRcLtUuz6K&t=eyJscyI6IndlYnNpdGUiLCJsc2QiOiJsaW5rLmNzZG4ubmV0Lz90YXJnZXQ9aHR0cHMlM0ElMkYlMkZkZXZlbG9wZXIubnZpZGlhLmNvbSUyRmN1ZGEtODAtZ2EyLWRvd25sb2FkLWFyY2hpdmUifQ== 
# tar -vxzf /home/featurize/data/cudnn-linux-x86_64-8.8.0.121_cuda11-archive.tar.gz
# cp /home/featurize/work/cudnn-linux-x86_64-8.8.0.121_cuda11-archive/include/cudnn.h /usr/local/cuda/include
# cp /home/featurize/work/cudnn-linux-x86_64-8.8.0.121_cuda11-archive/lib/libcudnn* /usr/local/cuda/lib64
# chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn* 

# install packages
conda install networkx==2.0 -y
conda install numpy==1.13.3 -y
conda install tqdm==4.19.4 -y

# install & test tensorflow_gpu
conda install tensorflow-gpu==1.3.0 -y
python /home/featurize/work/tensorflow_gpu_check.py