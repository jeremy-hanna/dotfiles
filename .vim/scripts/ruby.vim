" set comment_leader for ruby comments
let b:comment_leader = '# '

" execute rspec on current file
nmap <silent> <leader>r :!time bundle exec rspec % --color<CR>
" execute rspec on current spec on cursor line
nmap <silent> <leader>t :execute "!time bundle exec rspec %\:" . line(".")<CR>
" open relative spec file, turns out this is fairly complicated - should just
" shell out to fd or glob it
" nmap <silent> <leader>v :e =expand(
