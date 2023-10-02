#!/bin/sh

THIS_DIR="$(dirname "$(readlink -f "$0")")"

echo "\nDan's Mac Install Script"
echo "************************\n"

printf "Checking if Oh My Zsh is installed..."
if ! [ -d "$HOME/.oh-my-zsh" ]; then
  echo " Not installed - installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo " Done"
else echo " Already installed"; fi

printf "Checking if Homebrew is installed..."
if ! [ "$(command -v brew)" ]; then
  echo " Not installed - installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo " Done"
else echo " Already installed"; fi

printf "Installing / updating Homebrew packages..."
brew upgrade -q >/dev/null 2>&1
brew install -q python@3.11 git awscli nano nanorc ripgrep archey4 >/dev/null 2>&1
echo " Done"

printf "Checking if NVM is installed..."
if ! [ -d "$HOME/.nvm" ]; then
  echo " Not installed - installing..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  echo " Done"
else echo " Already installed"; fi

printf "Linking / copying config files..."
ln -sF "$THIS_DIR/.zshrc" "$HOME/.zshrc"
cp -f "$THIS_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sF "$THIS_DIR/.nanorc" "$HOME/.nanorc"
ln -sF "$THIS_DIR/.ssh/config" "$HOME/.ssh/config"
ln -sF "$THIS_DIR/.aws/config" "$HOME/.aws/config"
echo " Done"

printf "Checking for existence of SSH key..."
if ! [ -f "$HOME/.ssh/id_ed25519" ]; then
  echo " Not found - creating..."
  ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N "" -C ""
  echo " Done"
else echo " Already exists"; fi

printf "Adding SSH key to agent..."
ssh-add -q "$HOME/.ssh/id_ed25519"
echo " Done"

printf "Adding SSH key to Git signing configuration..."
echo "* $(<""$HOME""/.ssh/id_ed25519.pub)" >"$HOME/.ssh/allowed_signers"
git config --global user.signingkey "$(<""$HOME""/.ssh/id_ed25519.pub)"
echo " Done"

echo "\nScript complete! Reloading shell...\n\n"

zsh "$HOME/.zshrc"
