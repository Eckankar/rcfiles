#!/bin/bash

DIR=`pwd`

echo Installing vim config...
ln -fs $DIR/vimrc $HOME/.vimrc
ln -fs $DIR/vim $HOME/.vim
mkdir -p /var/tmp/vim-sebbe/swap
mkdir -p /var/tmp/vim-sebbe/undo

echo Installing zsh config...
ln -fs $DIR/zshcomplete $HOME/.zshcomplete
ln -fs $DIR/zshrc $HOME/.zshrc
ln -fs $DIR/zshenv $HOME/.zshenv
echo Setting default shell to zsh...
chsh -s `which zsh`

echo Installing git config...
ln -fs $DIR/gitconfig $HOME/.gitconfig

echo Installing screen config...
ln -fs $DIR/screenrc $HOME/.screenrc

echo Installing irssi config...
ln -fs $DIR/irssi $HOME/.irssi

echo Installing ack config...
ln -fs $DIR/ackrc $HOME/.ackrc

echo All done!

