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
# udpate timezone
dpkg-reconfigure tzdata
```
```
# Password management
# https://www.passwordstore.org/
apt-get install pass
pass init <email>
cd ~/.password-store
ln -s <folder with pass>
```
```
# export gpg key
gpg --export -a <key-id> > public.asc
gpg --export-secret-keys -a <key-id> > secret.asc

# import gpg key
gpg --import public.asc
gpg --import secret.asc

# trust key
gpg --edit-key <key-id> trust
```
