FROM phusion/baseimage:focal-1.0.0

ARG DOCKER_UID

RUN groupadd -g ${DOCKER_UID} www-data && \
    useradd -l -u ${DOCKER_UID} -g www-data -m www-data && \
    ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone; \
    sed -i 's/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -yqq \
      apt-utils \
      libzip-dev zip unzip

    