# source zplug
source ~/.zplug/init.zsh

# zplug packages
zplug zsh-users/zsh-syntax-highlighting, defer:2
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug check --verbose || zplug install

zplug load

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=~/.zsh_history

setopt HIST_FIND_NO_DUPS
setopt inc_append_history
setopt share_history

# homebrew : brew installed python
# export PATH=/usr/local/bin:/usr/local/share/python:$PATH

# alias tmux to use vim colorscheme instead of iTerm2
# alias tmux="TERM=screen-256color-bce tmux"

alias ll="ls -Gal"
alias vim="/usr/bin/nvim"
alias iex='ERL_AFLAGS="-kernel shell_history enabled" iex'

# don't kill session with C-d
setopt ignoreeof

# import .fzf key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add $HOME/bin to path for custom bash scripts
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:$HOME/Library/Python/3.7/bin

# Add language servers to path
export PATH=$PATH:$HOME/tools/lua-language-server/bin/macOS
export PATH=$PATH:$HOME/.cargo/bin


# Bind some convience keys for navigating shell commands
bindkey "^b" backward-word # ctrl + b
bindkey "^f" forward-word  # ctrl + f

# enable chruby and auto switching to .ruby-version
# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh

function rst () {
  sudo systemctl restart udevmon.service
  xmodmap ~/.Xmodmap
}

function slack () {
  flatpak run com.slack.Slack > /dev/null 2>&1 &
}

function spotify () {
  flatpak run com.spotify.Client > /dev/null 2>&1 &
}

function discord () {
  flatpak run com.discordapp.Discord > /dev/null 2>&1 &
}

function steam () {
  flatpak run com.valvesoftware.Steam > /dev/null 2>&1 &
}
