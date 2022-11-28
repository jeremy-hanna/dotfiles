
-- GoVet " vim-go compile go program

-- Linters
-- gosec - AST security
-- gofmt - formating
-- govet - compile bugs
-- godepth - depth complexity
-- staticcheck - simplification suggetsions

-- vim-go config
vim.g.go_def_mode = 'guru'
vim.g.go_code_completion_enabled = 0
vim.g.go_template_autocreate = 0

vim.g.go_alternate_mode = 'vsplit' -- TODO: set this to a hotkey

-- se. comment_leader for golang comments
vim.b.comment_leader = '// '

-- execute tests on current directory package,
-- ./ (dir) % (current filepath) p (path) . (reduce to relative) h (directory)
vim.api.nvim_set_keymap("n", "<leader>r", [[:!time go test -v ./%:p:.:h<CR>]], {})
-- autocmd BufWritePre *.go GoFmt " run vim-go GoFmt on save

