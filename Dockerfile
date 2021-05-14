FROM ubuntu:18.04
WORKDIR /usr/src/app/
COPY . /usr/src/app/
COPY ./src/config.cfg /usr/src/app/config.cfg
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install build-essential sed cmake libjpeg-dev libeigen3-dev -y \
    && make -C src
