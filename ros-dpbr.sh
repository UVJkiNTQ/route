#!/bin/sh
mkdir -p ./pbr
cd ./pbr

wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/cn.txt

{
echo "/ip firewall address-list"

while IFS= read -r net || [ -n "$net" ]; do
  [ -z "$net" ] && continue
  [[ "$net" == \#* ]] && continue
  
  if [[ "$net" == *.* && "$net" != *:* ]]; then
    echo "add list=CN address=$net comment=CN-IP"
  fi
done < CN.txt

} > ../CN.rsc



wget --no-check-certificate -c -O JP.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/refs/heads/release/text/jp.txt

{
echo "/ip firewall address-list"

while IFS= read -r net || [ -n "$net" ]; do
  [ -z "$net" ] && continue
  [[ "$net" == \#* ]] && continue
  
  if [[ "$net" == *.* && "$net" != *:* ]]; then
    echo "add list=JP address=$net comment=JP-IP"
  fi
done < JP.txt

} > ../JP.rsc

cd ..
rm -rf ./pbr 
