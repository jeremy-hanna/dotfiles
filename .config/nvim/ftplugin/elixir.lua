-- execute mix test on current file
vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', ':!time mix test % --color<CR>', { silent = true })

