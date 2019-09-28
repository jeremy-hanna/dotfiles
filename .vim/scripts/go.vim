" GoVet " vim-go compile go program

" Linters
" gosec - AST security
" gofmt - formating
" govet - compile bugs
" godepth - depth complexity
" staticcheck - simplification suggetsions
"
let g:go_alternate_mode = "vsplit"
let g:go_def_mode = "guru"

" set comment_leader for golang comments
let b:comment_leader = '// '

" execute tests on current directory package,
" ./ (dir) % (current filepath) p (path) . (reduce to relative) h (directory)
nmap <leader>r :!time go test -v ./%:p:.:h<CR>
" autocmd BufWritePre *.go GoFmt " run vim-go GoFmt on save

