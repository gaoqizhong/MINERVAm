#!/bin/bash

# create python2.7 environment by Anaconda
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/

# install packages
conda install networkx==2.0 -y
conda install numpy==1.13.3 -y
conda install tqdm==4.19.4 -y
conda install scipy -y

# install & test tensorflow-gpu
conda install tensorflow-gpu==1.3.0 -y