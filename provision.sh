#/bin/sh
username=$SUDO_USER
userhome=$(getent passwd $SUDO_USER | cut -d: -f6)
apt-get update
apt-get install -y xserver-xorg slim i3
apt-get install -y vim-gtk unzip alsa-utils rxvt-unicode-256color xclip feh x11-xserver-utils alsa-firmware-loaders pulseaudio
apt-get install -y fonts-inconsolata xfonts-terminus xfonts-terminus-oblique
# add google repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
# add skype repository
dpkg --add-architecture i386
apt-get install -y software-properties-common
add-apt-repository  "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
apt-get update
apt-get install -y skype google-chrome-stable
# configure autorun
echo 'setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ru,ua' > "${userhome}/.xsession"
echo 'feh --bg-scale images/island.jpg' >> "${userhome}/.xsession"
echo 'exec i3' >> "${userhome}/.xsession"
# copy required configuration files into user home directory
mkdir "${userhome}/.i3"
cp /vagrant/.i3/config "${userhome}/.i3/config"
cp /vagrant/.i3status.conf "${userhome}/.i3status.conf"
cp /vagrant/.Xresources  "${userhome}/.Xresources"
cp -r /vagrant/images/ "${userhome}/images/"
chown -R ${username}:${username} "${userhome}/.xsession" "${userhome}/.i3/" "${userhome}/.i3status.conf" "${userhome}/.Xresources" "${userhome}/images/"
# put this tasty command prompt into .bashrc
#PS1='\[\033[01;30m\]\t \[\e[0;36m\]\u\[\e[m\]@\[\033[00;32m\]\h\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[0;34m\]\w\[\033[00m\] $ '
echo 'fs.inotify.max_user_watches=16384' >> /etc/sysctl.conf
