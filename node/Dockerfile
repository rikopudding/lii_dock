FROM node:12-slim
COPY ./sources.list.stretch /etc/apt/sources.list
# WORKDIR /usr/src/app  

RUN apt update && \  
    npm --registry=https://registry.npm.taobao.org install -g npm @vue/cli
    # cd /usr/src/app/vue-element-admin && \
    # npm install  --registry=https://registry.npm.taobao.org 

# RUN npm --registry=https://registry.npm.taobao.org install -g npm @vue/cli  
# CMD [ "cd /usr/src/app/vue-element-admin && npm install --registry=https://registry.npm.taobao.org " ]