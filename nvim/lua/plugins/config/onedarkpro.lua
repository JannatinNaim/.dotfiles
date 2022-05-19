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
    fg = "#a0a8b7",
    red = "#e55561",
    orange = "#cc9057",
    yellow = "#e2b86b",
    green = "#8ebd6b",
    cyan = "#48b0bd",
    blue = "#4fa6ed",
    purple = "#bf68d9",
    -- purple = "#42d4f5",
    black = "#0e1013",
    gray = "#535965",

    -- bg_statusline = "#282C34",
    -- fg_gutter = "#323641",
    -- fg_sidebar = "#8EBD6B"

    -- default_purple = "#BF68D9",
  },
  hlgroups = {
    CursorLineNr = { fg = "NONE" },
    -- Statement = { fg = "${default_purple}" },
    -- Conditional = { fg = "${default_purple}" },
    -- Repeat = { fg = "${default_purple}" },
    -- Keyword = { fg = "${default_purple}" },
    -- Exception = { fg = "${default_purple}" },
    -- Include = { fg = "${default_purple}" },
    -- Define = { fg = "${default_purple}" },
    -- Structure = { fg = "${default_purple}" },
    -- Typedef = { fg = "${default_purple}" },
  },
  filetype_hlgroups = {
    -- TSAttribute = { fg = "${default_purple" },
    -- TSConstBuiltin = { fg = "${default_purple" },
    -- TSInclude = { fg = "${default_purple" },
    -- TSKeyword = { fg = "${default_purple" },
    -- TSKeywordFunction = { fg = "${default_purple" },
    -- TSKeywordOperator = { fg = "${default_purple" },
    -- TSLabel = { fg = "${default_purple" },
    -- TSRepeat = { fg = "${default_purple" },
  }
})

onedarkpro.load()
