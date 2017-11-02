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
    git config --global push.default simple
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O
else
    echo "GIT not present. Skiping GIT configuration"
fi

echo "Installing pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Installing vim-fugitive"
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q
cd -
