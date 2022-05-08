local status_ok, schemsstore = pcall(require, "schemastore")
if not status_ok then
  return
end

local opts = {
  settings = {
    json = {
      schemas = schemsstore.json.schemas(),
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

return opts
