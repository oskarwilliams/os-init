#!/bin/bash

# Install and update xcode and other recommended software
xcode-select --install
softwareupdate -i -r

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Brew
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Brew casks and formulas
brew bundle --file=Brewfile

cp .zshrc.initial ~/.zshrc
cp .p10k.zsh.initial ~/.p10k.zsh
cp -R .oh-my-zsh-custom ~/.oh-my-zsh/custom