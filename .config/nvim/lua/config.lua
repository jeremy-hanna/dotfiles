local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local cmd = vim.cmd
local g = vim.g
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

----------------------------------
-- Setup Plugins -----------------
----------------------------------
-- require("settings.functions")
-- require("settings.compe").setup()
-- require("settings.telescope").setup()
-- require("settings.lsp").setup()

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")

-- LSP
map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
map("n", "K", [[<cmd>lua require"lspsaga.hover".render_hover_doc()<CR>]])
map("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
map("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
map("n", "gds", [[<cmd>lua vim.lsp.buf.document_symbol()<CR>]])
map("n", "gws", [[<cmd>lua vim.lsp.buf.workspace_symbol()<CR>]])
