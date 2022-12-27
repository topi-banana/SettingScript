sudo echo "network:
  version: 2
  wifis:
    wlp2s0:
      addresses: [192.168.2.25/24]
      gateway4: 192.168.2.1
      nameservers:
        addresses: [8.8.8.8]
      access-points:
        elecom-45f753:
          password: u5ifkijnc45r
      dhcp4: false
" > /etc/netplan/00-installer-config-wifi.yaml

sudo netplan apply
