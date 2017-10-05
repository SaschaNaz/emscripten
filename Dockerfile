# For travis
FROM ubuntu:16.04
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive
COPY . /

RUN apt-get update \
 && apt-get install -y python python-pip wget git cmake build-essential software-properties-common \
 && pip install --upgrade pip \
 && pip install lit \
 && add-apt-repository ppa:webupd8team/java \
 && apt-get update \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
 && apt-get install -y oracle-java9-installer \
 && wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz \
 && tar -xf emsdk-portable.tar.gz \
 && cd emsdk-portable \
 && ./emsdk update \
 && ./emsdk install latest \
 && ./emsdk activate latest \
 && source ./emsdk_env.sh
