#!/bin/bash
#----------------------------------------------------------------------------------------------
#
#   Author: ma-kappa
#   Description: Define dotfiles in the current directory as a symbolic link to files under the /dotfiles directory.
#
#----------------------------------------------------------------------------------------------

#DOTFILES=( .zsh .zshrc .zshrc.custom .zshrc.alias .zshrc.linux .zshrc.osx .ctags .emacs.el .gdbinit .gemrc .gitconfig .gitignore .inputrc .irbrc .sbtconfig .screenrc .vimrc .vim .vrapperrc import.scala .tmux.conf .dir_colors .rdebugrc .pryrc .percol.d)

DOTFILES=( .bashrc .tmux.conf .vimrc )

for file in ${DOTFILES[@]}
do
    if [ ! -L ~/"$file" ] && [ -f ~/"$file" ]; then
        echo "Move ~/$file to ~/$file."`date +%Y%m%d%H%M%S`.bak
        mv -f ~/"$file" ~/"$file".`date +%Y%m%d%H%M%S`.bak
    fi
    if [ ! -L ~/"$file" ]; then
        echo "Create symbolic-link ~/$file => ~/dotfiles/$file"
        ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done

