" vim-go - gofmt on save, completion, syntax highlighting
" GoAlternate " vim-go open <file>_test.go
" GoVet " vim-go compile go program

" Linters
" gosec - AST security
" gofmt - formating
" govet - compile bugs
" godepth - depth complexity
" staticcheck - simplification suggetsions

" set comment_leader for comments
let b:comment_leader = '// '

" execute tests on current directory
nmap <leader>r :!time go test<CR>

