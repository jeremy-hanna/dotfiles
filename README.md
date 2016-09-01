# The dotfiles for each new provisioned dev space.
So this repo was created to specifically set up a clean way to tear down and start up clean installations of any Linux distro or OS X version relatively easily. It is going to be directly pulled from a chefcook book and copied over from there. Hopefully this isn't a complete waste of time.

## How to use
OS X dependencies:
* Homebrew
* vim 7.4+
* tmux

copy files to home folder:
 * cp zshrc ~/.zshrc
 * cp vimrc ~/.vimrc
 * cp tmux.conf ~/.tmux.conf
 * cp -r vim ~/.vim

install vim plugins
* :PlugInstall

## TODO:
### Function
User config
* git configuration
* oh-my-zsh

Vim config
* File search - Ctrl-P / NodeTree
* Syntax indicators
  * syntax highlighting
  * whitespace highlighting
  * git blame
* Text navigation
  * Airline
  * some tab complete
* Rails specific
  * Rails.vim
  * run ajoining spec cmd / vim-fireplace

### Style
* tmux split colors
* fonts
* default tmux split view for laptop + monitor view
