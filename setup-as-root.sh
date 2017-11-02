#!/bin/bash


if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

PACKAGES="
vim-python-jedi
vim-common
vim-runtime
vim-latexsuite
vim-scripts
vim-syntastic
vim-vimoutliner
"

echo $PACKAGES
apt-get install $PACKAGES
