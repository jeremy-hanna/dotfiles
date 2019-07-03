" set comment_leader for ruby comments
let b:comment_leader = '// '

" execute jest tests or whatever is set in package.json
nmap <leader>r :!time CI=true yarn test<CR>

" prettier on save
