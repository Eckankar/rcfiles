#!/bin/sh
# Install dependencies for vim's haskell mode

echo "Installing Haskell dependencies for vim"

echo "Installing GHC..."
sudo apt update
sudo apt install -y ghc cabal-install

echo "Updating cabal..."
cabal update

echo "Installing needed cabal packages..."
export PATH=~/.cabal/bin:$PATH
cabal install happy ghc-mod hlint

echo "Installing vimproc..."
mkdir -p ~/build
cd ~/build
git clone https://github.com/Shougo/vimproc.vim.git vimproc
cd vimproc
make -f make_unix.mak

echo "Done!"
