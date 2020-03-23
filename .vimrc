" Vim plugins
call plug#begin('~/.vim/bundle')
" --- Editing utility ---
Plug 'godlygeek/tabular'    " align tables
Plug 'reedes/vim-pencil'    " text wrapping navigation
Plug 'majutsushi/tagbar'    " ctag navigation split
Plug 'lvht/tagbar-markdown' " tagbar markdown support
Plug 'tpope/vim-surround'   " git wrapper gblame
" Plug 'jpalardy/vim-slime' " send line text to a REPL
" --- Git and File utility ---
" Plug '/usr/local/opt/fzf' " import Homebrew fzf installation
" Plug 'junegunn/fzf.vim'   " fzf function wrapper
" Plug 'airblade/vim-gitgutter' " gutter for git diff changes
Plug 'tpope/vim-fugitive' " git wrapper gblame
" --- Visuals and syntax ---
Plug 'ntpeters/vim-better-whitespace'
" Plug 'vim-airline/vim-airline'
" --- Ruby ---
" --- Elixir ---
Plug 'elixir-editors/vim-elixir'
" --- GoLang ---
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " GoLang editing improvments
" --- React ---
Plug 'maxmellon/vim-jsx-pretty' " syntax highlighting for jsx
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " auto formatting
Plug 'rstacruz/vim-closer'  " close '({[' for writing ES6
Plug 'alvan/vim-closetag'   " close React component and HTML tags
" --- Misc Formatting ---
" Plug 'hashivim/vim-terraform'
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
" set wildmode=longest,list,full
" set wildmenu
" wildignore=

" set vim leader to space
nmap <space> <leader>

" load specific configurations based on filetype
" - <r> running spec(s)
" - comment leader
" - <v> open rel spec file
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au Filetype ruby             source ~/.vim/scripts/ruby.vim
  au Filetype elixir           source ~/.vim/scripts/elixir.vim
  au Filetype go               source ~/.vim/scripts/go.vim
  au FileType sh,python        let b:comment_leader = '# '
  au FileType javascript,javascriptreact source ~/.vim/scripts/js.vim
  au FileType vim              let b:comment_leader = '" '
  au BufRead,BufNewFile *.tf*	 source ~/.vim/scripts/terraform.vim
  au BufNewFile,BufRead *.bib  set filetype=markdown " this sets syntax and ctag checking to markdown
endif

" Add visual comments based on the $comment_leader
" - visual leader is mapped to \ by default
" Comment out selected lines + format them
vnoremap <leader>fa :s/^/\=b:comment_leader/g<CR>gv=
" Uncomment selected lines (copied from StackOverflow = black magic)  + format     them
vnoremap <leader>fr :s@\V<c-r>=escape(b:comment_leader,'\@')<cr>@@<cr>gv=

" Edit a file in the directory of the file currently being edited
nmap <leader>e :e <C-R>=expand("%:p:h") . "/"<CR>

" set vim-closetag variables
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact'
let g:closetag_emptyTags_caseSensitive = 1

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

" add simple toggle for ProseMode
command! ProseMode call ProseMode()
nmap <leader>p :ProseMode<CR>

" --- Note Commands ---
" Add prose function to open a filepath as a note, creates the file before
" opening it or returns the file path from what is passed io the function
function! OpenNote(arg)
  let notefile=system("note -p " . a:arg) " create the file and directory to it
  execute "edit" notefile
endfunction

" call note, leave cmd open to add directory / file
" command! -nargs=1 Note call OpenNote(<f-args>) " most of this is to tab complete input
" nmap <silent> <leader>n :Note

" TODO
" standardize the tab opening for specific flows:
" - open a file + open the spec
" - discovery
" - text editing
" - creating a note
" FZF searches over too many things, need to global config it
" timestamp as a function
" quick way of citing sources (notes / cites / books / pubs)
