#!/bin/bash

# Install and update xcode and other recommended software
xcode-select --install
softwareupdate -i -r

# Install Oh My Zsh if not installed
if [ ! -d  $HOME/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10K if not installed
if [ ! -d  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]
then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install Brew if not installed
if ! command -v brew &> /dev/null
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Brew casks and formulas
brew bundle --file=Brewfile

# Copy over initial config
cp .zshrc.initial ~/.zshrc
cp .p10k.zsh.initial ~/.p10k.zsh
cp functions.zsh ~/.oh-my-zsh/custom/functions.zsh
