# sudo dd bs=1M if=image.img of=/dev/[XXX]
# raspi-config -> internationalization (5) -> keyboard setup
# configure wifi (/etc/wpa_supplicant/wpa_supplicant.conf)

apt-get update && apt-get -y upgrade

apt-get -y install tcpdump python-pip python-dev bluetooth libbluetooth-dev git mercurial python-usb python-crypto python-serial libgcrypt-dev

pip install pybluez
pip install hg+https://bitbucket.org/secdev/scapy-com
pip install git+https://github.com/jdongian/killerbee.git

cp bt.py wardrive.sh /usr/bin
chmod +x /usr/bin/bt.py /usr/bin/zbwardrive.sh

cp iot-setup /etc/init.d
update-rc.d iot-setup defaults
