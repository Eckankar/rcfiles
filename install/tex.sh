#!/bin/sh
DLDIR=`mktemp -d`
MAINPKG=$DLDIR/Frederiksberg-2-2.tgz
ICS=$DLDIR/ics.tgz
IMF=$DLDIR/imf.zip

# Download packages
wget -O "$MAINPKG" http://matdat.life.ku.dk/LaTeX/Frederiksberg/download/Frederiksberg-2-2.tgz
wget -O "$ICS" http://matdat.life.ku.dk/LaTeX/Frederiksberg/download/units/ics.tgz
wget -O "$IMF" http://matdat.life.ku.dk/LaTeX/Frederiksberg/download/units/imf.zip

sudo mkdir -p /usr/local/share/texmf
cd /usr/local/share/texmf

# Clean up
sudo rm -rf dvips/KULIFE tex/latex/beamer/KULIFE
sudo rm -rf dvips/Frederiksberg tex/latex/beamer/Frederiksberg texmf

# Install main package
sudo tar xfvz "$MAINPKG"
# Install units
sudo tar xfvz "$ICS"
sudo unzip "$IMF"

# Rehash tex
sudo texhash

# Delete the download folder
sudo rm -r "$DLDIR"
