# Dan's Mac Install Script

Just navigate inside and execute `./install.sh`

Does the following:

- Installs [Oh My Zsh](https://ohmyz.sh/) (if it isn't already installed)
- Installs [Homebrew](https://brew.sh/) (if it isn't already installed)
- Installs / updates the following Homebrew packages:
  - python@3.11
  - git
  - awscli
  - nano
  - nanorc
  - ripgrep
  - archey4
- Installs [nvm (Node Version manager)](https://github.com/nvm-sh/nvm) (if it isn't already installed)
- Symlinks or copies various config files into the home folder
- Creates an EdDSA SSH key pairing (if it doesn't already exist)
- Adds SSH key to SSH agent and Git signing configuration

It may do more in future, but for now, this gets me up and running fairly quickly.
