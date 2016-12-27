#!/bin/bash
git submodule init
git submodule update
sudo apt-get install npm nodejs ctags golang xdotool node-less

#jslint, tern
sudo npm install -g jshint
cd bundle/tern_for_vim
sudo npm install

#jsbeautify
cd ../jsbeautify
git submodule update --init --recursive

#tagbar-phpctags
cd ../tagbar-phpctags
make

#youcompleteme
#WERKT OOK NIET
#sudo apt-get install vim-addon-manager
#sudo apt-get install vim-gocomplete
#sudo apt-get install vim-youcompleteme
#vam install gocomplete
#vam install youcompleteme
#FOUT: installatie error:
#cd ../youcompleteme
#git submodule init; git submodule update; 
#git submodule foreach git pull origin master
#git submodule update --init --recursive
#./install.py --gocode-completer --tern-complete

#vimrc maken
cd ../../
ln -s vimrc ../.vimrc
echo "done!";
