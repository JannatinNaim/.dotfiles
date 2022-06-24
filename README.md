![dotfiles Banner](./docs/images/dotfiles.png)

OS specific dotfiles that I use. Know that these are customized specifically for my needs and you may not find them
helpful. Nonetheless, take some inspiration if you want to. :) All the config files are structured based on the
application and OS. These files are to be symlinked where needed.

## User Guide

If you feel like trying out the same config as I have (probably not a good idea), you can do so with the following
steps.

* Clone this repository

  * `git clone https://github.com/JannatinNaim/.dotfiles ~/.dotfiles.jannatinnaim`
  > You can replace the `~/.dotfiles.jannatinnaim` at the end and use any directory you like. If you do change it,
  > execute the other commands with the directory you set here.

* Go to your OS specific directory.

  * `cd ~/.dotfiles.jannatinnaim/MacOS` - if you're on MacOS.
  * `cd ~/.dotfiles.jannatinnaim/Linux` - if you're on Linux.
  * `cd ~/.dotfiles.jannatinnaim/Windows` - if you're on Windows.

* Symlink the config files / directories based on the application.

  * `ln -sf ~/.dotfiles.jannatinnaim/MacOS/nvim/ ~/.config/` - for NeoVim config on MacOS.
  * `ln -sf ~/.dotfiles.jannatinnaim/MacOS/git/.gitconfig ~/.gitconfig` - for git config on MacOS.
  * `ln -sf ~/.dotfiles.jannatinnaim/MacOS/zsh/.zshrc ~/.zshrc` - for ZSH config on MacOS.
  > These commands will **replace** any existing config files so make a backup before you try this.

If you followed the steps correctly you should now have the same setup as me. If you're not sure where to put which
files, refer to the application's documentation on config files.
