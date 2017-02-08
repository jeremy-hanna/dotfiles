" set comment_leader for ruby comments
let b:comment_leader = '// '

" execute rspec on current file
nmap ,r :!time go test<CR>
