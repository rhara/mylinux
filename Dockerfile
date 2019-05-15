FROM ubuntu:18.04

COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get install sudo -y
RUN apt-get install curl wget rsync -y
RUN apt-get install net-tools iputils-ping -y
RUN apt-get install openssh-server -y
RUN apt-get install xauth -y
RUN apt-get install lsof -y
RUN apt-get install bzip2 xz-utils zstd unzip zip -y
RUN apt-get install git subversion -y
RUN apt-get install vim emacs -y
RUN apt-get install libxrender-dev -y
RUN apt-get install x11-apps -y
RUN apt-get install gimp -y
RUN apt-get install zsh -y

RUN mkdir /run/sshd

RUN echo AddressFamily inet >> /etc/ssh/sshd_config

RUN echo '%sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN useradd -m -s /usr/bin/zsh -g users -G sudo,adm rhara
RUN echo 'root:password' | chpasswd
RUN echo 'rhara:password' | chpasswd

RUN mkdir /home/rhara/.ssh
COPY id_rsa.pub /home/rhara/.ssh/authorized_keys
RUN chmod 600 /home/rhara/.ssh/authorized_keys
RUN chown -R rhara:users /home/rhara/.ssh

EXPOSE 22

USER rhara
WORKDIR /home/rhara

RUN wget -c -q -P /tmp https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash /tmp/Miniconda3-latest-Linux-x86_64.sh -b

ENV PATH=/home/rhara/miniconda3/bin:/home/rhara/miniconda3/condabin:$PATH
RUN conda create -n chem36 python=3.6 -y
ENV PATH=/home/rhara/miniconda3/envs/chem36/bin:$PATH
ENV CONDA_EXE=/home/rhara/miniconda3/bin/python
ENV CONDA_PYTHON_EXE=/home/rhara/miniconda3/bin/python
ENV CONDA_SHLVL=1
ENV CONDA_PREFIX=/home/rhara/miniconda3/envs/chem36
ENV CONDA_DEFAULT_ENV=chem36

RUN conda upgrade --all -n base -c default -y
RUN conda upgrade --all -c default -y

RUN conda install psutil -y
RUN conda install numpy scipy scikit-learn pandas scikit-image -y
RUN conda install jupyter notebook bokeh -y
RUN conda install -c rdkit rdkit -y
RUN conda install -c omnia pdbfixer -y
RUN conda install -c conda-forge py3dmol -y
RUN conda install -c conda-forge aspw -y
