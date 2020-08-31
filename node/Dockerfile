FROM node:12
COPY ./sources.list.stretch /etc/apt/sources.list
# WORKDIR /usr/src/app  

RUN apt update && \  
    npm --registry=https://registry.npm.taobao.org install -g npm @vue/cli  