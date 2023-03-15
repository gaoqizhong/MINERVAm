sudo -i

# install Anaconda3
wget -P /tmp https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash /tmp/Anaconda3-2020.02-Linux-x86_64.sh
source ~/.bashrc

# install NVIDIA dirver
cp /home/featurize/myMINERVA/build/blacklist.conf /etc/modprobe.d
update-initramfs -u

# install CUDA
wget https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda_11.2.0_460.27.04_linux.run