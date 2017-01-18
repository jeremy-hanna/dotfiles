# source zplug
source ~/.zplug/init.zsh

# zplug packages
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug 'robbyrussell/oh-my-zsh', use:'lib/*'
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug 'themes/blinks', from:oh-my-zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

zplug load --verbose

export PATH=/usr/local/bin:/usr/local/share/python:$PATH

#alias tmux to use vim colorscheme instead of iTerm2
alias tmux="TERM=screen-256color-bce tmux"
