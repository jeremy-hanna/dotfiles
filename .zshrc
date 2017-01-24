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

#alias tmux to use vim colorscheme instead of iTerm2
alias tmux="TERM=screen-256color-bce tmux"
