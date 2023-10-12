# Dan's Mac Install Script

Just clone into your `$HOME` folder (e.g. `/Users/dan`), navigate inside and execute `./install.sh`

Does the following:

- Installs or updates [Oh My Zsh](https://ohmyz.sh/).
- Installs or updates [Homebrew](https://brew.sh/).
- Installs or updates the following Homebrew packages (and updates any other Homebrew packages installed):
  - python@3.11
  - git
  - awscli
  - nano
  - nanorc
  - ripgrep
  - archey4
- Installs or updates [nvm (Node Version manager)](https://github.com/nvm-sh/nvm)
- Symlinks or copies various config files into the home folder
- Creates an EdDSA SSH key pairing (if it doesn't already exist)
- Adds SSH key to SSH agent and Git signing configuration

It may do more in future, but for now, this gets me up and running fairly quickly.
