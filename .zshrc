# source zplug
source ~/.zplug/init.zsh

# zplug packages
zplug zsh-users/zsh-syntax-highlighting, defer:2
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug check --verbose || zplug install

zplug load


# homebrew : brew installed python
# export PATH=/usr/local/bin:/usr/local/share/python:$PATH

# alias tmux to use vim colorscheme instead of iTerm2
# alias tmux="TERM=screen-256color-bce tmux"

alias ll="ls -Gal"

# cli-improved suggested tools see: https://remysharp.com/2018/08/23/cli-improved
# alias cat='bat'
# alias ping='prettyping --nolegend'
# alias top="sudo htop" # alias top and fix high sierra bug
# alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
# alias help='tldr'
# file directory list with display
# alias preview="fzf --preview 'bat --color \"always\" {}'"

# import .fzf key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add $HOME/bin to path for custom bash scripts
export PATH=$PATH:$HOME/bin
# export PATH=$PATH:$HOME/Library/Python/3.7/bin

# enable chruby and auto switching to .ruby-version
# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh
