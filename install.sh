!/bin/bash
git submodule init
git submodule update
sudo npm install -g jslint
cd bundle/tern_for_vim
sudo npm install
cd ../jsbeautify
git submodule update --init --recursive
ln -s vimrc ../.vimrc
cd ../../
echo "done!";
echo "install vim, nodejs+npm, ctags"
