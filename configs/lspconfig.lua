-- Servers to be setup with basic settings
local basic_servers = { "tsserver", "svelte", "emmet_ls", "cssls", "html", "jsonls", "tailwindcss" }

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
        nilness = true,
        shadow = true,
      },
    },
  },
}

for _, server in ipairs(basic_servers) do
  lspconfig[server].setup { on_attach = on_attach, capabilities = capabilities }
end
