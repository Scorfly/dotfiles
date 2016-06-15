# dotfiles

personal dotfiles

```
# be updated
apt-get update
apt-get upgrade
```
```
# install my favorit packet
apt-get install git htop zsh screen vim xclip curl suckless-tools tree
apt-get install rxvt-unicode-256color
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
# install config files
cd ~/.dotfiles
./install.sh
```

TODO :

Ajouter certain élément de securité indiqué sur :
 - https://openclassrooms.com/courses/securiser-son-serveur-linux

Gérer les clé ssh

Interdir la connexion en root via ssh
