" Vim plugins
call plug#begin('~/.vim/bundle')
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

colorscheme apprentice

" Don't use .swp files
set noswapfile

" Expand tabs, use 2 spaces to tab
set tabstop=2
set shiftwidth=2
set expandtab

" Use relative line numbers with actual line number on active line
set rnu
set nu

" highlight white line at 80 char
highlight ColorColumn ctermbg=235
set colorcolumn=80

" TODO:
" Plug 'thoughtbot/vim-rspec'
" Plug 'tComment'
" - remap a different key for <Esc>
" - ctags ?
