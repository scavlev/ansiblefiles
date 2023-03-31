#!/bin/bash

if [[ ! -L ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.bak
fi

ln -sfn $SCRIPT_LOCATION/dotfiles/zshrc ~/.zshrc

if [[ ! -L ~/.bashrc ]]; then
  mv ~/.bashrc ~/.bashrc.bak
fi

ln -sfn $SCRIPT_LOCATION/dotfiles/bashrc ~/.bashrc

if [[ ! -L ~/.gitconfig ]]; then
  mv ~/.gitconfig ~/.gitconfig.bak
fi

ln -sfn $SCRIPT_LOCATION/dotfiles/gitconfig ~/.gitconfig

mkdir -p ~/.config/Code/User

if [[ ! -L ~/.config/Code/User/settings.json ]]; then
  mv ~/.config/Code/User/settings.json ~/.config/Code/User/settings.json.bak
fi

ln -sfn $SCRIPT_LOCATION/dotfiles/settings.json ~/.config/Code/User/settings.json
