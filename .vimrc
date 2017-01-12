call plug#begin('~/.vim/bundle')
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

colorscheme apprentice

set rnu
set nu

highlight ColorColumn ctermbg=235
set colorcolumn=80

" TODO:
" - remap a different key for <Esc>
" - ctags ?
