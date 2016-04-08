#!/bin/bash

sudo apt-get update
sudo apt-get -y install linux-headers-$(uname -r) build-essential libssl-dev
sudo apt-get install -y git curl 
sudo apt-get install -y vim-gtk
sudo apt-get install -y exuberant-ctags ncurses-term
sudo apt-get install -y ack-grep ctags
sudo apt-get install -y zsh

#install the oh-my-zsh
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh 
sudo chsh -s /bin/zsh vagrant	

# Change the oh my zsh default theme and set autostart tmux.
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git tmux npm bower common-alias)/g' ~/.zshrc
sed -i '/source $ZSH\/oh-my-zsh.sh/i\ZSH_TMUX_AUTOSTART="true"\n' ~/.zshrc
sed -i '/source $ZSH\/oh-my-zsh.sh/i\ZSH_TMUX_AUTOQUIT="true"\n' ~/.zshrc
sed -i '1i export TERM="xterm-256color"' ~/.zshrc

#install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | PROFILE=~/.zshrc zsh
source /home/vagrant/.zshrc	
zsh

cd /home/vagrant/
#install vim plugins

git clone https://github.com/dpalomar/dot-vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sed -i 's/colorscheme molokai_kenan/colorscheme solarized/g' ~/.vimrc
#install nerd fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

fc-cache -vf ~/.local/share/fonts/
#install node and so on.
nvm install 0.12.12
nvm alias default v0.12.12
npm install -g npm
npm install -g csslint
npm install -g jshint
npm install -g jsonlint
npm install -g js-yaml
npm install -g yo 
npm install -g bower
npm install -g gulp
npm install -g gulp-cli
# #npm link gulp
npm install -g grunt-cli
npm install -g grunt
npm install -g generator-webapp
npm install -g generator-gulp-angular
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.zsh_history && exit
echo "*************************************************************************"
echo "***********************INSTALL COMPLETE**********************************"
echo "*************************************************************************"
echo "*                    Run vagrant ssh to start"
echo "* First time you could run next command to configure vim "
echo "*               vim +BundleInstall +qall"
echo "*"
echo "**REMEMBER:** If you like create projects with shared folders in windows"
echo "* You must run vagrant up with administrator rights"
echo "*"
echo "* To start a web project create a folder and use: yo gulp-angular or yo webapp"
echo "*"
echo "* Run exit and vagrant halt to shutdown"
echo "*************************************************************************"
echo "Author: David Palomar"
echo "*****************************ENJOY***************************************"

