----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()
metals_config.root_patterns = { "build.sbt" }

metals_config.settings = {
  -- bloopSbtAlreadyInstalled = true,
  showImplicitArguments = true,
  -- sbtScript = '/Users/jeremy.hanna/go/src/github.com/DataDog/dd-analytics/sbt.sh',
  -- scalafmtConfigPath = '/Users/jeremy.hanna/go/src/github.com/DataDog/dd-analytics/.scalafmt.conf',
  excludedPackages = {
    "akka.actor.typed.javadsl",
    "com.github.swagger.akka.javadsl",
    "akka.stream.javadsl",
  },
}

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Start the LSP server
require("metals").initialize_or_attach(metals_config)
require("lsp_signature").setup()

----------------------------------
-- Metals bindings ---------------
----------------------------------

map("n", "<leader>ws", '<cmd>lua require"metals".worksheet_hover()<CR>')
map("n", "<leader>a", '<cmd>lua require"metals".open_all_diagnostics()<CR>')

map("n", "<leader>tt", [[<cmd>lua require("metals.tvp").toggle_tree_view()<CR>]])
map("n", "<leader>tr", [[<cmd>lua require("metals.tvp").reveal_in_tree()<CR>]])
