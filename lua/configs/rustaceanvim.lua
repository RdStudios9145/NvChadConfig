local on_attach = require("lua.configs.lspconfig").on_attach
local capabilities = require("lua.configs.lspconfig").capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}
