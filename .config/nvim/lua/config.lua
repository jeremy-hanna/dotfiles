local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/bundle')
-- --- Editing utility ---
Plug('godlygeek/tabular')     -- align tables
Plug('tpope/vim-surround')    -- git wrapper gblame
Plug('kana/vim-textobj-user') -- create custom vim text-objects
Plug('dense-analysis/ale')    -- Asynchronous Lint Engine - runs prettier
Plug('hrsh7th/vim-vsnip')     -- vscode like snippets
-- --- Prose and markdown ---
Plug('reedes/vim-pencil')     -- text wrapping navigation
Plug('majutsushi/tagbar')     -- ctag navigation split
Plug('lvht/tagbar-markdown')  -- tagbar markdown support
Plug('junegunn/goyo.vim')
-- --- Git and File utility ---
-- Plug('/usr/local/opt/fzf')  " import Homebrew fzf installation
-- Plug('junegunn/fzf.vim')    " fzf function wrapper
Plug('tpope/vim-fugitive')    -- git wrapper gblame
-- --- Visuals and syntax ---
Plug('ntpeters/vim-better-whitespace')
-- --- Ruby ---
-- --- Rust ---
Plug('simrat39/rust-tools.nvim')
Plug('saecki/crates.nvim', { branch = 'main' })
-- --- Python ---
-- --- Elixir ---
Plug('elixir-editors/vim-elixir') -- elixir syntax highlight
Plug('andyl/vim-textobj-elixir')  -- make elixir blocks text-objects
-- --- GoLang ---
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' }) -- GoLang editing improvments
-- --- React ---
Plug('maxmellon/vim-jsx-pretty') -- syntax highlighting for jsx
Plug('rstacruz/vim-closer')  -- close '({[' for writing ES6
Plug('alvan/vim-closetag')   -- close React component and HTML tags
-- --- Misc Formatting ---
-- Plug('hashivim/vim-terraform')
Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- We recommend updating the parsers on update
Plug('mfussenegger/nvim-dap')
Plug('kevinhwang91/nvim-bqf', { branch = 'main' })
-- Plug('glepnir/lspsaga.nvim', { 'branch': 'main') }
Plug('ray-x/lsp_signature.nvim')
-- --- Scala ---
Plug('nvim-lua/plenary.nvim')
Plug('scalameta/nvim-metals', { branch = 'main' })
vim.call('plug#end')

local set = vim.opt
local cmd = vim.cmd
local g = vim.g
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

g.mapleader = " "

----------------------------------
-- Vim settings  ------------------
----------------------------------
cmd [[colorscheme apprentice]]
set.relativenumber = true
set.number = true

cmd [[highlight ColorColumn ctermbg=235]]
set.colorcolumn = '80'
set.hlsearch = false

set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.smartindent = true

set.swapfile = false
set.wildmenu = true
set.wildmode='longest:full,full'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- leave insert mode quickly
-- https://stackoverflow.com/questions/13404602/how-to-prevent-esc-from-waiting-for-more-input-in-insert-mode/13485315#13485315
cmd [[
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscapeInsert
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
]]

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

----------------------------------
-- Normal bindings----------------
----------------------------------
map("n", "Q", [[<nop>]])

map("n", "<leader>e", [[:e <C-r>=expand("%:p:h") . '/'<CR>]], { silent = false })
-- Add visual comments based on the $comment_leader
-- - visual leader is mapped to \ by default
-- Comment out selected lines + format them
map("v", "<leader>fa", [[:s/^/\=b:comment_leader/g<CR>gv=]])
-- Uncomment selected lines (copied from StackOverflow = black magic)  + format     them
map("v", "<leader>fr", [[:s@\V<c-r>=escape(b:comment_leader,'\@')<cr>@@<cr>gv=]])

----------------------------------
-- Compiler and QFX --------------
----------------------------------
map("n", "~", [[:make<CR>]])
map("n", "]q", [[:lnext<CR>]])
map("n", "[q", [[:lprevious<CR>]])
map("n", "]Q", [[:cnext<CR>]])
map("n", "[Q", [[:cprev<CR>]])
map("n", "<leader>Q", [[:cclose<CR>]])
map("n", "]b", [[:bnext<CR>]])
map("n", "[b", [[:bprev<CR>]])

----------------------------------
-- LSP ---------------------------
----------------------------------
map("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]])
map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
map("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
map("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
map("n", "gds", [[<cmd>lua vim.lsp.buf.document_symbol()<CR>]])
map("n", "gws", [[<cmd>lua vim.lsp.buf.workspace_symbol()<CR>]])

-- load specific configurations based on filetype
-- - <r> running spec(s)
-- - comment leader
-- - <v> open rel spec file
-- TODO: move these to ftplugins
cmd [[
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au Filetype ruby             source ~/.vim/scripts/ruby.vim
  au FileType sh,python        let b:comment_leader = '# '
  au FileType javascript,javascriptreact source ~/.vim/scripts/js.vim
  au FileType typescript,typescriptreact source ~/.vim/scripts/js.vim
  au FileType vim              let b:comment_leader = '" '
  au BufRead,BufNewFile *.tf*	 source ~/.vim/scripts/terraform.vim
  au BufNewFile,BufRead *.bib  set filetype=markdown " this sets syntax and ctag checking to markdown
endif
]]
-- au Filetype elixir           source ~/.vim/scripts/elixir.vim
-- au Filetype go               source ~/.vim/scripts/go.vim

----------------------------------
-- Ale ---------------------------
----------------------------------
g.ale_lint_on_text_changed = 'never' -- don't lint on a changed buffer
g.ale_lint_on_enter = 0              -- don't lint on file open
g.ale_linters_explicit = 1           -- only lint opt-in extensions
g.ale_fix_on_save = 1                -- run extension fixer on save only
g.ale_fixers = {
  elixir = 'mix_format',
  javascript = 'prettier',
  javascriptreact = 'prettier',
  typescript = 'prettier',
  typescriptreact = 'prettier',
  css = 'prettier',
}

----------------------------------
-- Vim-clostag vars --------------
----------------------------------
g.closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact'
g.closetag_emptyTags_caseSensitive = 1

----------------------------------
-- Snippet mappings --------------
----------------------------------
cmd [[
  imap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
  smap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
  imap <expr> <C-l> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>'
  imap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : "<C-k>"
  smap <expr> <C-l> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>'
  smap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : "<C-k>"
]]
g.vsnip_snippet_dir = vim.fn.expand('~/.vim/snippets')
