#!/bin/bash
# Install dependencies (debootstrap)
sudo apt -y install git live-build cdebootstrap debootstrap curl
# Fetch the latest Kali debootstrap script from git
wget  https://http.kali.org/pool/main/k/kali-archive-keyring/kali-archive-keyring_2020.2_all.deb
wget https://archive.kali.org/kali/pool/main/l/live-build/live-build_20191221_all.deb
sudo apt -y install git live-build cdebootstrap debootstrap curl
sudo dpkg -i kali-archive-keyring_2020.2_all.deb
sudo dpkg -i live-build_20191221_all.deb
cd /usr/share/debootstrap/scripts/
(echo "default_mirror http://http.kali.org/kali"; sed -e "s/debian-archive-keyring.gpg/kali-archive-keyring.gpg/g" sid) > kali
ln -s kali ./kali-rolling
cd ~
git clone https://gitlab.com/kalilinux/build-scripts/live-build-config
cd live-build-config/
sudo ./build.sh --variant light --verbose
