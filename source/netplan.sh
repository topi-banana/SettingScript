l=$(
sudo lshw -class network \
| grep -Eo "(詳細|description): (.+)" \
| grep -En "(無線インターフェース|Wireless interface)" \
| grep -Eo "^[0-9]+"
)

wifiName=$(
sudo lshw -class network \
| awk 'match($0, /(logical name|論理名): (.+)/, a){print a[2]}' \
| sed -n $l'p'
)

read -p "192.168.2." ip

read -p "ok? (y/N): " yn

case "$yn" in
  [yY]*) echo "Start Settings";;
  *) echo "Cancel..."; exit 0;;
esac

sudo echo "network:
  version: 2
  wifis:
    "$wifiName":
      addresses: [192.168.2."$ip"/24]
      gateway4: 192.168.2.1
      nameservers:
        addresses: [8.8.8.8]
      access-points:
        elecom-45f753:
          password: u5ifkijnc45r
      dhcp4: false
" | sudo tee /etc/netplan/00-installer-config-wifi.yaml

sudo netplan apply
