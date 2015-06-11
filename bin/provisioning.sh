#!/usr/bin/sh

sudo xcodebuild -license
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install ansible
brew install git

git clone https://github.com/DaiJpn/mac-provisioning.git

echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.bash_profile
source $HOME/.bash_profile

cd $HOME/mac-provisioning
ansible-playbook -i hosts -vv development.yml
