local status_ok, onedarkpro = pcall(require, "onedarkpro")
if not status_ok then
  return
end

onedarkpro.setup({
  dark_theme = "onedark",
  options = {
    bold = true,
    italic = true,
    cursorline = true,
    transparency = true,
    terminal_colors = true,
  },
  plugins = {
    all = true,
  },
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "bold",
    variables = "bold",
  },
  colors = {
    -- colors.fg = "#abb2bf"
    fg = "#a0a8b7",
    -- colors.red = "#e06c75"
    red = "#e55561",
    -- colors.orange = "#d19a66"
    orange = "#cc9057",
    -- colors.yellow = "#e5c07b"
    yellow = "#e2b86b",
    -- colors.green = "#98c379"
    green = "#8ebd6b",
    -- colors.cyan = "#56b6c2"
    cyan = "#48b0bd",
    -- colors.blue = "#61afef"
    blue = "#4fa6ed",
    -- colors.purple = "#c678dd"
    purple = "#bf68d9",
    -- colors.black = "#282c34"
    black = "#0e1013",
    -- colors.gray = "#5c6370"
    gray = "#535965",
  }
})

onedarkpro.load()

vim.cmd "highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE"
