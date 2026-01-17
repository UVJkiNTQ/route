#!/bin/sh
set -e  # 遇到错误立即退出

mkdir -p ./pbr
cd ./pbr

# 下载 IP 列表文件
wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/cn.txt
wget --no-check-certificate -c -O JP.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/jp.txt

# 处理 CN 列表
{
  echo "/ip firewall address-list"
  
  # 使用 grep 过滤 IPv4 地址并处理
  grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+' CN.txt | while read -r net; do
    echo "add list=CN address=$net comment=CN-IP"
  done
} > ../CN.rsc

# 处理 JP 列表
{
  echo "/ip firewall address-list"
  
  # 使用 grep 过滤 IPv4 地址并处理
  grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+' JP.txt | while read -r net; do
    echo "add list=JP address=$net comment=JP-IP"
  done
} > ../JP.rsc

cd ..
rm -rf ./pbr
