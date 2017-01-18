" Vim plugins
call plug#begin('~/.vim/bundle')
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

" colorscheme apprentice

" Don't use .swp files
set noswapfile

" Use relative line numbers with actual line number on active line
set rnu
set nu

" highlight white line at 80 char
highlight ColorColumn ctermbg=235
set colorcolumn=80

" TODO:
" - remap a different key for <Esc>
" - ctags ?
