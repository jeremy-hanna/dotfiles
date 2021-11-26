" Vimscript to start up
set runtimepath^=~/.vim runtimepath+=~/.vim/after

let &packpath = &runtimepath
let g:python3_host_prog='~/.pyenv/versions/py3nvim/bin/python'

" it's nice having ~/.vimrc be fairly vanilla
" source ~/.vimrc

" Load the lua config
lua require('config')
