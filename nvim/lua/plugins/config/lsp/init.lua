local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugins.config.lsp.lsp-installer"
require("plugins.config.lsp.handlers").setup()
require "plugins.config.lsp.null-ls"
