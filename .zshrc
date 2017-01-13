export PATH=/usr/local/bin:/usr/local/share/python:$PATH

#alias tmux to use vim colorscheme instead of iTerm2
alias tmux="TERM=screen-256color-bce tmux"
alias ts="ssh -A dev-jhanna"
alias pc="ssh -A jhanna@prod-worker-utility.riskio.us"

#source /usr/local/Cellar/zsh/5.0.6/antigen/antigen.zsh

# Load the oh-my-zsh's library.
#antigen use oh-my-zsh
#
## Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found
#
## Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting
#
## Load theme
#antigen theme blinks
#
## Tell antigen that you're done.
#antigen apply
#
#### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"
