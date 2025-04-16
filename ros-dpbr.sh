#!/bin/sh
mkdir -p ./pbr
cd ./pbr

wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/cn.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN address=$net comment=CN-IP"
done

} > ../CN.rsc



wget --no-check-certificate -c -O JP.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/jp.txt

{
echo "/ip firewall address-list"

for net in $(cat JP.txt) ; do
  echo "add list=JP address=$net comment=JP-IP"
done

} > ../JP.rsc

cd ..
rm -rf ./pbr
