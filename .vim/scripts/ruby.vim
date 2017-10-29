" set comment_leader for ruby comments
let b:comment_leader = '# '

" execute rspec on current file
nmap ,r :!time bundle exec rspec % --color<CR>
" execute rspec on current spec on cursor line
nmap ,t :execute "!time bundle exec rspec %\:" . line(".")<CR>
