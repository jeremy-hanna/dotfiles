" Vim plugins
call plug#begin('~/.vim/bundle')
" --- Editing utility ---
Plug 'godlygeek/tabular'    " align tables
Plug 'reedes/vim-pencil'    " text wrapping navigation
Plug 'majutsushi/tagbar'    " ctag navigation split
Plug 'lvht/tagbar-markdown' " tagbar markdown support
" Plug 'jpalardy/vim-slime' " send line text to a REPL
" --- Git and File utility ---
Plug '/usr/local/opt/fzf' " import Homebrew fzf installation
Plug 'junegunn/fzf.vim' " fzf function wrapper
" Plug 'airblade/vim-gitgutter' " gutter for git diff changes
Plug 'tpope/vim-fugitive' " git wrapper gblame
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

" commandline completion
set wildmode=longest,list,full
set wildmenu
" wildignore=

" set vim leader to space
nmap <space> <leader>

" load specific configurations based on filetype
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au Filetype ruby             source ~/.vim/scripts/ruby.vim
  au Filetype go               source ~/.vim/scripts/go.vim
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
nmap <leader>e :e <C-R>=expand("%:p:h") . "/"<CR>

" leave insert mode quickly
" https://stackoverflow.com/questions/13404602/how-to-prevent-esc-from-waiting-for-more-input-in-insert-mode/13485315#13485315
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscapeInsert
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" vim-pencil, tagbar and markdown ctags for editing markdown
" make sure exuberant ctags are installed
" http://scholarslab.org/research-and-development/code-spelunking-with-ctags-and-vim#mac
let g:pencil#conceallevel = 0 " hide markdown syntax off
let g:pencil#wrapModeDefault = "soft"
let g:tagbar_width = 50
let g:tagbar_sort = 0      " sort tagbar by name off
let g:tagbar_left = 1      " open tagbar on the left
let g:tagbar_silent = 1    " disable echoing tag
let g:tagbar_foldlevel = 1 " higher order tags will be folded on open

" Add prose function toggle for editing longform
"      - need tag generation on open?
function! ProseMode(...)
  if !exists("b:proseon")
    let b:proseon = 0 " this is the buffer local variable proseon
  endif

  let a:prose = get(a:, 1, 2) " a: is the argument variable prefix

  if a:prose == 1 || (b:proseon == 0 && a:prose == 2) " check if it's already on
    call pencil#init({"wrap": "soft"})
    execute "TagbarOpen"
    setlocal spell " turn spell checking on buffer locally
    let b:proseon = 1
  else
    call pencil#init({"wrap": "off"})
    execute "TagbarClose"
    setlocal nospell
    let b:proseon = 0
    execute "e"
  endif
endfunction

" --- Note Commands ---
" add simple toggle for ProseMode
command! ProseMode call ProseMode()
nmap <leader>p :ProseMode<CR>

" call note, leave cmd open to add directory / file
" command! -nargs=1 Note call OpenNote(<f-args>)

" nmap <silent> <leader>n :Note 

" TODO
" change instances of ,<...> to <leader><...>
" standardize the tab opening for specific flows:
" - open a file + open the spec
" - discovery
" - text editing
" - creating a note
" FZF searches over too many things, need to global config it
" timestamp as a function
" quick way of citing sources (notes / cites / books / pubs)
