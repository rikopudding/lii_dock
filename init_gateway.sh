#!/bin/bash

# set -e



success_msg_color='40'
info_msg_color='33'
error_msg_color='9'
warning_msg_color='220'


function success_msg {
        echo -e "\e[38;5;${success_msg_color}m$1\e[0m"
}

function info_msg {
        echo -e "\e[38;5;${info_msg_color}m$1\e[0m"
}

function error_msg {
        echo -e "\e[38;5;${error_msg_color}m$1\e[0m"
}

function warning_msg {
        echo -e "\e[38;5;${warning_msg_color}m$1\e[0m"
}



function install_base_packages() {

    # apt 的 HTTP Pipelining 特性与 Nginx 服务器疑似存在一定的不兼容问题
    sudo bash -c 'echo "Acquire::http::Pipeline-Depth \"0\";" > /etc/apt/apt.conf.d/99nopipelining'
    sudo sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list




    sudo apt-get update  > /dev/null
    sudo apt-get install -y bash-completion git curl net-tools vim tree make rsync zip tar psmisc  > /dev/null


    success_msg '安装完成 --- 基础软件'
    
}


function install_docker() {

    if command -v docker >/dev/null 2>&1; then
        warning_msg "安装完成 --- docker 已安装，跳过"
    else
        sudo apt-get install -yqq \
                    ca-certificates \
                    curl \
                    gnupg \
                    lsb-release
        sudo mkdir -m 0755 -p /etc/apt/keyrings > /dev/null
        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg       
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
        sudo apt-get update > /dev/null
        sudo apt-get install -yqq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > /dev/null
        success_msg '安装完成 --- docker'

    fi
}


function init_docker() {
    
    if sudo systemctl is-enabled docker >/dev/null 2>&1; then
        warning_msg "初始设定 --- docker 已设置开机自启，跳过"
    else
        sudo systemctl enable docker > /dev/null 2>&1
        success_msg "初始设定 --- docker 开机自启设置成功"
    fi
    
    docker_network_name='lii_network'
    # 创建网络
    sudo docker network ls | grep $docker_network_name > /dev/null
    if [ $? -eq 0 ]; then
        warning_msg "初始设定 --- docker $docker_network_name 网络已存在，跳过"
    else
        sudo docker network create --subnet 172.31.0.0/16 --gateway 172.31.0.1 $docker_network_name > /dev/null
        success_msg "初始设定 --- docker $docker_network_name 网络创建成功"
    fi
    # 设置镜像源
    sudo echo '{"registry-mirrors": ["https://registry.docker-cn.com"]}' > /etc/docker/daemon.json
    
}

# 初始化开始
function start() {
    # set -x
    install_base_packages
    install_docker
    init_docker
}

start




