# source zplug
source ~/.zplug/init.zsh

# zplug packages
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug 'lib/completion', from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug 'themes/blinks', from:oh-my-zsh

zplug check --verbose || zplug install

zplug load

# homebrew : brew installed python
export PATH=/usr/local/bin:/usr/local/share/python:$PATH

# enable chruby and auto switching to .ruby-version
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

#alias tmux to use vim colorscheme instead of iTerm2
alias tmux="TERM=screen-256color-bce tmux"

alias ll="ls -Gal"

# GoPath to source go libs in src
export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH/bin
alias gomake='make_new_go_program'
alias goinstall='install_go_program'
alias gorun='run_go_program'

make_new_go_program () {
  new_project="$1"
  new_val="$GOPATH/src/github.com/jeremy-hanna/$1"
  mkdir $new_project && ln -s $PWD/$new_project $new_val
}

install_go_program () {
  go install github.com/jeremy-hanna/$1
}

run_go_program () {
  eval "$GOPATH/bin/$1"
}
