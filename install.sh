#!/bin/sh

set -ux

cd
if [ ! -d dotfiles ] ; then
  git clone git@github.com:usmanm/dotfiles.git
fi

cd dotfiles
git pull origin master

# Install packages I can't live without.
cat packages.txt | xargs sudo apt-get -y install
sudo pip install -r requirements.txt

# Copy over dotfiles to your home directory.
ln -f -s `pwd`/bashrc ~/.bashrc
ln -f -s `pwd`/psqlrc ~/.psqlrc
ln -f -s `pwd`/emacs ~/.emacs
ln -f -s `pwd`/gitconfig ~/.gitconfig
