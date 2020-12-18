TAG=ubuntu:coatsn
LOCAL_WORKING_DIR=$(pwd)

docker build -t $TAG .
docker run -it \
    -v $LOCAL_WORKING_DIR:/usr/src/app \
    -v $(echo ~)/.kube:/root/.kube \
    $TAG