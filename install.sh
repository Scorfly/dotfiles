#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

symlink () {
    /bin/ln -s $2 $1
}

SCRIPT_REALPATH=`readlink -f $0`
DOTFILES_DIR=`dirname ${SCRIPT_REALPATH}`

# zsh
symlink "${HOME}/.zshrc" "${DOTFILES_DIR}/zshrc"

# vim
symlink "${HOME}/.vimrc" "${DOTFILES_DIR}/vimrc"

# git
symlink "${HOME}/.gitconfig" "${DOTFILES_DIR}/gitconfig"

# Xdefault for rxvt
symlink "${HOME}/.Xdefaults" "${DOTFILES_DIR}/Xdefaults"
