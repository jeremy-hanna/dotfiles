" set comment_leader for ruby comments
let b:comment_leader = '// '

" execute rspec on current file
nmap <leader>r :!time CI=true yarn test<CR>
