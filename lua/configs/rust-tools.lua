local on_attach = require("lua.configs.lspconfig").on_attach
local capabilities = require("lua.configs.lspconfig").capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}

return options
