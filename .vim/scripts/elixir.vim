" set comment_leader for elixir comments
let b:comment_leader = '# '

" execute mix test on current file
nmap <silent> <leader>r :!time mix test % --color<CR>
