# dotfiles

personal dotfiles

```
# be updated
apt-get update
apt-get upgrade
```
```
# install my favorit packet
apt-get install git htop zsh screen vim xclip curl suckless-tools ncdu tree
apt-get install rxvt-unicode rxvt-unicode-256color
# sound controller
apt-get install pavucontrol
```
```
# add my user
adduser scorfly
vim /etc/sudoers
```
```
# change my hostname
vim /etc/hostname
vi /etc/hosts
/etc/init.d/hostname.sh start
```
```
# change shell
chsh
```
```
# change ssh conf
PermitRootLogin  no
Port xxxxx
```
```
# install config files
cd ~/.dotfiles
./install.sh
```
```
# Password management
# https://www.passwordstore.org/
apt-get install pass
```

TODO :

Ajouter certain élément de securité indiqué sur :
 - https://openclassrooms.com/courses/securiser-son-serveur-linux

Gérer les clé ssh
