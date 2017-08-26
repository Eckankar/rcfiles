#!/bin/bash

# Installs the configuration files in your home directory.

cd "$(dirname "$(readlink -f $0)")/.."
DIR=`pwd`

echo Installing vim config...
ln -Tfs $DIR/vimrc $HOME/.vimrc
ln -Tfs $DIR/vim $HOME/.vim
mkdir -p /var/tmp/vim-sebbe/swap
mkdir -p /var/tmp/vim-sebbe/undo

echo Installing zsh config...
ln -Tfs $DIR/zshcomplete $HOME/.zshcomplete
ln -Tfs $DIR/zshrc $HOME/.zshrc
ln -Tfs $DIR/zshenv $HOME/.zshenv
touch $HOME/.zshenv.local
echo Setting default shell to zsh...
chsh -s `which zsh`

echo Installing git config...
ln -Tfs $DIR/gitconfig $HOME/.gitconfig

echo Installing screen config...
ln -Tfs $DIR/screenrc $HOME/.screenrc

echo Installing irssi config...
ln -Tfs $DIR/irssi $HOME/.irssi

echo Installing ack config...
ln -Tfs $DIR/ackrc $HOME/.ackrc

echo Installing scripts...
mkdir -p $HOME/bin
ln -Tfs $DIR/bin/build-vim $HOME/bin/build-vim
ln -Tfs $DIR/bin/git-shitcommit $HOME/bin/git-shitcommit

echo All done!

