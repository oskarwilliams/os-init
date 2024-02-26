#!/bin/bash

# Update apt
sudo apt update

# Install zsh if not installed
sudo apt install zsh -y

# Install build essentials
sudo apt install build-essential
sudo apt install libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev make gcc

# Install Oh My Zsh if not installed
if [ ! -d  $HOME/.oh-my-zsh ]
then
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh syntax highlighting if not installed
if [ ! -d  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]
then
    echo "Installing zsh syntax highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Install Powerlevel10K if not installed
if [ ! -d  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]
then
    echo "Installing Powerlevel10K"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install brew if not installed
if ! command -v brew &> /dev/null
then
    echo "Installing brew"
    sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install nvm if not installed
if ! command -v nvm &> /dev/null
then
    echo "Installing nvm"
    /bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.6/install.sh)"
fi

# Install Brew casks and formulas
echo "Installing brew casks and formulas"
brew bundle --file=Brewfile

# Copy over initial config
echo "Copying config"
cp .zshrc.initial ~/.zshrc
cp .p10k.zsh.initial ~/.p10k.zsh
cp functions.zsh ~/.oh-my-zsh/custom/functions.zsh

# Upgrade all existing brew installs
echo "Upgrading brew casks and formulas"
brew upgrade
