local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  save_after_format = true,
  sources = {
    -- diagnostics.cspell.with({
    --  extra_args = { "-c", vim.fn.expand("~/.config/nvim/lua/plugins/settings/lsp/settings/cspell.json") },
    --  disabled_filetypes = { "NvimTree" },
    -- }),

    formatting.trim_newlines,
    formatting.trim_whitespace,

    -- formatting.stylua,
    -- diagnostics.luacheck,

    formatting.prettier.with({
      prefer_local = true,
      extra_args = {
        "--print-width",
        120,
      },
    }),
    -- formatting.eslint.with({
    --   prefer_local = true,
    -- }),
    -- diagnostics.eslint.with({
    --   prefer_local = true,
    -- }),
    -- code_actions.eslint.with({
    --   prefer_local = true,
    -- }),

    -- formatting.autopep8,
    -- diagnostics.flake8,

    -- formatting.markdownlint,
    -- diagnostics.markdownlint,

    -- diagnostics.zsh,
    -- diagnostics.gitlint,

    -- diagnostics.proselint,
    -- hover.dictionary,

    -- code_actions.gitsigns,
    -- code_actions.refactoring,
  },
})
