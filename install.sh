#/bin/bash

echo 'init ...'
sudo pacman -S urxvt xorg-xinit xorg-server xf86-video-intel sudo acpid intel-ucode zsh
sudo systemctl enable acpid
clear

echo "install yaourt...."
sudo echo "[archlinuxcn]
The Chinese Arch Linux communities packages.
SigLevel = Optional TrustedOnly
Server   = http://repo.archlinuxcn.org/$arch" >> /etc/pacman.conf
sudo pacman -Syy archlinuxcn-keyring 
sudo pacman -S yaourt
clear


echo 'config theme....'
sudo yaourt -S xcursor-maia arc-gtk-theme lxappearance
clear

echo 'config hosts...'
wget https://iiio.io/download/20170927/Android%E5%AE%89%E5%8D%93%E8%B7%9FLinux%E7%B3%BB%E5%88%97.zip -O /tmp/hosts.zip

sudo cp /etc/hosts /etc/hosts.bak
cd /tmp
unzip /tmp/hosts.zip
sudo cp /tmp/hosts /etc/hosts
sudo chmod 644 /etc/hosts
clear

echo 'config volume'
sudo pacman -S volumeicon alsa-utils
amixer sset Master unmute
clear

echo 'install i3wm & application....'
yaourt -S i3-gaps polybar-git ttf-font-awesome
sudo pacman -S compton rofi fcitx fcitx-im fcitx-configtool chromium feh wget unzip pepper-flash pcmanfm stardict

sudo tar -jxvf stardict-langdao-ec-gb-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
clear


