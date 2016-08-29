#!/bin/bash
#This executable bash file installs Atom editor, python3.5, java8 installer,
# pycharm, chrome browser, unity-tweak-tool, minecraft, vlc, virtualbox, git-lfs
# ubuntu-restricted-extras, gparted, and ccrypt.It also retrieves a backup,
# Removes the Guest Session only allowing administrator to log in, places the
# Username on top right of App panel, and sets the background image. It reboots
# system after changes.


echo "Downloading PPAs"
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:mystic-mirage/pycharm
sudo add-apt-repository -y ppa:ravefinity-project/ppa
sudo add-apt-repository -y ppa:minecraft-installer-peeps/minecraft-installer
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "Updating repositories"
sudo apt-get update -y
echo "Installing packages"
sudo apt install -y atom python3.5 oracle-java8-installer pycharm google-chrome-stable minecraft-installer vlc unity-tweak-tool ubuntu-restricted-extras gparted ccrypt
echo "Updating packages"
sudo apt-get upgrade -y
echo "Removing Guest Session"
sudo sh -c "echo 'allow-guest=false' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf"
echo "Enabeling Admin name on App panel"
gsettings set com.canonical.indicator.session show-real-name-on-panel true
echo "INSTALLING VIRTUALBOX"
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo apt-get update
sudo apt install -y virtualbox-qt
echo "Setting Desktop Background" #currently from github repository
wget https://github.com/Splinter1021/master_backup/raw/master/HarleyQuinn.jpg
gsettings set org.gnome.desktop.background picture-uri 'file:///home/splinter/HarleyQuinn.jpg'
echo "Installing git-lfs" #next command is found at https://packagecloud.io/github/git-lfs/install
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install -y git-lfs
echo "Retrieving backup, decrypting, and extracting to recover file" #currently from github repository
wget https://github.com/Splinter1021/master_backup/raw/master/backup.tar.gz.cpt
sudo ccrypt -d backup.tar.gz.cpt
sudo mkdir /recover
sudo tar -xvpzf /backup.tar.gz -C /recover
echo "Splinter is now ready!"
echo "System will reboot"
reboot
