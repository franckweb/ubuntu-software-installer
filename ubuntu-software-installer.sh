#!/bin/bash
# make it executable with: chmod +x ubuntu_software_installer.sh
# execute it with: sh ubuntu_software_installer.sh

## update
sudo apt-get update

# base install
sudo apt install -y git zsh curl tmux tree zip unzip p7zip-full

## change current user shell
sudo chsh -s /bin/zsh $CUR_USER

## gnome-tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweaks

## postman
# sudo snap install postman
# Direct download links for v9.31.30 (last version before 10.0):
# https://dl.pstmn.io/download/version/9.31.30/linux

## docker
# Add Docker's official GPG key:
sudo apt-get install ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install latest docker version
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

## vscode 
sudo snap install --classic code

## dbeaver
sudo snap install dbeaver-ce

## slack
sudo snap install slack

## brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

## simplenote
sudo snap install simplenote

echo "Ubuntu software installation done"
