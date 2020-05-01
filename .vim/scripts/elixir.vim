" set comment_leader for elixir comments
let b:comment_leader = '# '

" set the debug_cmd for elixir pry statements
let b:debug_cmd = 'require IEx; IEx.pry'

" execute mix test on current file
nmap <silent> <leader>r :!time mix test % --color<CR>
