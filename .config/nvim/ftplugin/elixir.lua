-- set comment_leader for elixir comments
vim.b.comment_leader = '#'

-- set the debug_cmd for elixir pry statements
vim.b.debug_cmd = 'require IEx; IEx.pry'

-- execute mix test on current file
vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', ':!time mix test % --color<CR>', { silent = true })

