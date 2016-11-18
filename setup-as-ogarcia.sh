#!/bin/bash

PWD=$(pwd)

echo "Installing vimrc"
if [ -f ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.old
fi
cp .vimrc ~/.vimrc

echo "Installing bash-ogarcia-rc"
if ! grep -q ". $PWD/bash-ogarcia-rc" ~/.bashrc 
then
  echo ". $PWD/bash-ogarcia-rc" >> ~/.bashrc
fi

if command -v git >/dev/null 2>&1
then
    echo "GIT present. Configure GIT"
    git config --global user.name "Oscar García"
    git config --global user.email o.garcia@i2tic.com
    git config --global core.editor vim
    git config --global color.ui auto
    curl https://github.com/git/git/blob/master/contrib/completion/git-completion.bash -O
else
    echo "GIT not present. Skiping GIT configuration"
fi
