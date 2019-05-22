" set comment_leader for ruby comments
let b:comment_leader = '// '

" execute rspec on current file
nmap <leader>r :!time go test<CR>
