local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "lua",
    "markdown",
    "python",
    "scss",
    "typescript",
    "vim",
  }, -- Always installed.
  sync_install = false, -- Synchronously install.
  autopairs = {
    enable = true,
  }, -- Auto pairs support.
  autotag = {
    enable = true,
  }, -- Auto tags support.
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  }, -- Syntax highlighting.
  indent = { enable = true }, -- Indentation support.
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }, -- Context aware commenting.
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
