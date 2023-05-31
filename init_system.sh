#!/bin/bash

set -e

network_name='lii_network'
subnet='172.31.0.0/16'
gateway='172.31.0.1'

# 创建网络
docker network ls | grep $network_name > /dev/null
if [ $? -eq 0 ]; then
    echo "$network_name exists"
else
    docker network create --subnet $subnet --gateway $gateway $network_name > /dev/null
    echo "$network_name created"
fi






