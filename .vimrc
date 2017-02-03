" Vim plugins
call plug#begin('~/.vim/bundle')
" --- Editing utility ---
" Plug 'tpope/vim-surround'
" Plug 'godlygeek/tabular'
" --- Git and File utility ---
" Plug 'ctrlp.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
" --- Visuals and syntax ---
Plug 'ntpeters/vim-better-whitespace'
" Plug 'vim-airline/vim-airline'
" --- Ruby ---
" --- Clojure ---
" Plug 'tpope/vim-fireplace'
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

" load specific configurations based on filetype
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au Filetype ruby             source ~/.vim/scripts/ruby.vim
  au FileType sh,python        let b:comment_leader = '# '
  au FileType javascript       let b:comment_leader = '// '
  au FileType vim              let b:comment_leader = '" '
endif

" Add visual comments based on the $comment_leader
" Comment out selected lines + format them
vnoremap <Leader>fa :s/^/\=b:comment_leader/g<CR>gv=
" Uncomment selected lines (copied from StackOverflow = black magic)  + format     them
vnoremap <Leader>fr :s@\V<c-r>=escape(b:comment_leader,'\@')<cr>@@<cr>gv=

" Edit a file in the directory of the file currently being edited
nmap ,e :e <C-R>=expand("%:p:h") . "/"<CR>

" remap a different key for <Esc> since new MBP doesn't have a key :(

" TODO:
" - ctags ?
