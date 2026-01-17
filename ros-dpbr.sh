#!/bin/sh
mkdir -p ./pbr
cd ./pbr

wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/cn.txt

{
echo "/ip firewall address-list"

for net in $(cat cn.txt) ; do
  # 检查是否是IPv4地址（包含.且不包含:）
  if [[ $net == *.* && $net != *:* ]]; then
    echo "add list=CN address=$net comment=CN-IP"
  fi
done

} > ../CN.rsc



wget --no-check-certificate -c -O JP.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/jp.txt

{
echo "/ip firewall address-list"

for net in $(cat jp.txt) ; do
  # 检查是否是IPv4地址（包含.且不包含:）
  if [[ $net == *.* && $net != *:* ]]; then
    echo "add list=JP address=$net comment=JP-IP"
  fi
done

} > ../JP.rsc

cd ..
rm -rf ./pbr 
