# Container-Native Linux Development Environment

**Goal:** Provide a portable shell with utility.

## Usage

1. Checkout

    ```sh
    git clone https://github.com/coatsnmore/linux-container-workspace
    cd linux-container-workspace
    ```

2. Mount your working directory and credentials.

    ```sh
    UNIQUE_TAG=ubuntu:coatsn
    docker build -t $UNIQUE_TAG .
    docker run -it \
        -v $(pwd):/usr/src/app \
        -v $(echo ~)/.kube:/home/ubuntu/.kube
        -it $UNIQUE_TAG
    ```

## Includes:
- [x] kubectl
- [x] helm
- [x] curl
- [x] jq
- [x] yq
- [x] dig
- [x] nslookup
- [ ] aws-cli
- [ ] glcoud-cli