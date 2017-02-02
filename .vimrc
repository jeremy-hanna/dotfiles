" Vim plugins
call plug#begin('~/.vim/bundle')
" --- Text utility ---
"  tabular
"  vim-surround
" --- Dir and git utility ---
"  ctrlp
"  vim-fugitive
"  git-gutter
" --- Appearance ---
Plug 'ntpeters/vim-better-whitespace'
" airline
" Plug ''
" --- Clojure ---
"  vim-fireplace
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

" load specific settings depending on file
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd FileType ruby        source ~/.vim/scripts/ruby.vim
  autocmd FileType javascript  let b:comment_leader = '// '
  autocmd FileType vim         let b:comment_leader = '" '
endif

" Comment out selected lines + format them
vnoremap <Leader>fa :s/^/\=b:comment_leader/g<CR>gv=
" Uncomment selected lines (copied from StackOverflow = black magic)  + format     them
vnoremap <Leader>fr :s@\V<c-r>=escape(b:comment_leader,'\@')<cr>@@<cr>gv=

" Edit a file in the directory of the file currently being edited
nmap ,e :e <C-R>=expand("%:p:h") . "/"<CR>

" TODO:
" remap a different key for <Esc>
