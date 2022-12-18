-- Enable the lua LSP
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
      },
      diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
      },
      workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
          enable = false,
      },
    },
  },
}
require "lsp_signature".setup({
  bind = true,
})


-- Give the test runner a keymap
-- vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', ':!time busted %<CR>', { silent = true })
