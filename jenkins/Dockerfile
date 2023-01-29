FROM jenkins/jenkins:lts-jdk11

USER root
SHELL ["/bin/bash", "-c"]

ARG TIMEZONE
RUN rm -rf /etc/localtime && ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
ARG CHANGE_SOURCE=false
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # Change application source from deb.debian.org to aliyun source
    sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list \
;fi

# if we want to install via apt
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

ARG GOVER="1.19.4"
ENV GOVER ${GOVER}

COPY files/composer.phar /usr/local/bin/composer

ARG SET_HTTP_PROXY=""
ENV SET_HTTP_PROXY ${SET_HTTP_PROXY}
ARG SET_HTTPS_PROXY=""
ENV SET_HTTPS_PROXY ${SET_HTTPS_PROXY}
ARG SET_ALL_PROXY=""
ENV SET_ALL_PROXY ${SET_ALL_PROXY}


RUN chmod 775 /usr/local/bin/composer && \
apt-get update && \
apt-get install -y wget && \
apt-get install -y rsync php7.4-cli php7.4-mbstring php7.4-xml php7.4-curl make && \
groupmod -o -g ${PUID} jenkins && \
usermod -o -u ${PGID} jenkins && \
if [ "${SET_HTTP_PROXY}" != "" ];then export http_proxy=${SET_HTTP_PROXY} ;fi && \
if [ "${SET_HTTPS_PROXY}" != "" ];then export https_proxy=${SET_HTTPS_PROXY} ;fi && \
if [ "${SET_ALL_PROXY}" != "" ];then export all_proxy=${SET_ALL_PROXY} ;fi && \
wget https://go.dev/dl/go1.19.4.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go${GOVER}.linux-amd64.tar.gz && rm go${GOVER}.linux-amd64.tar.gz && \
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile && source /etc/profile && go version && \
wget -O gf https://github.com/gogf/gf/releases/latest/download/gf_$(go env GOOS)_$(go env GOARCH) && chmod +x gf && ./gf install -y && rm ./gf && \
unset http_proxy && unset https_proxy && unset all_proxy && \
go env -w GO111MODULE=on && go env -w GOPROXY=https://goproxy.cn,direct

# drop back to the regular jenkins user - good practice
USER jenkins


