FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y curl pgp wget apt-transport-https gnupg2

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

# TODO: install jq and yq

WORKDIR /usr/src/app