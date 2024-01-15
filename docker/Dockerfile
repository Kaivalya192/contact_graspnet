FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

RUN apt-get update && apt-get install -y  wget

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    echo "source /opt/conda/bin/activate" > ~/.bashrc

# set default shell to bash (and login to execute .bashrc)
SHELL [ "/bin/bash", "-c","-l" ]

# copy env files and immutable code
WORKDIR /contact_graspnet
COPY environment.yaml .
COPY compile_pointnet_tfops.sh .
COPY pointnet2/ pointnet2/
COPY checkpoints/ checkpoints/
COPY tools/ tools/
COPY uniform_quaternions/ uniform_quaternions/
COPY contact_graspnet/tf_train_ops.py contact_graspnet/tf_train_ops.py

# install requirements in base env 
RUN conda env update -n=base -f environment.yaml
# compile pointnet ops
RUN chmod +x compile_pointnet_tfops.sh && ./compile_pointnet_tfops.sh

# copy source code 
COPY contact_graspnet/ .


