FROM ubuntu:latest

RUN apt update
RUN apt install -y curl pgp wget apt-transport-https gnupg2 dnsutils jq sudo

# install yq
RUN apt install -y software-properties-common
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CC86BB64
RUN add-apt-repository ppa:rmescandon/yq
RUN apt update
RUN apt install -y yq

# install kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update \
    && apt-get install -y kubectl

# install helm
RUN HELM_INSTALL_FILE=helm-v3.4.2-linux-amd64.tar.gz
RUN wget https://get.helm.sh/helm-v3.4.2-linux-amd64.tar.gz
RUN tar xvf helm-v3.4.2-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/

# TODO: install gcloud SDK + CLI

RUN adduser --disabled-password --gecos "" ubuntu
USER ubuntu
ADD .bashrc /home/ubuntu

WORKDIR /usr/src/app