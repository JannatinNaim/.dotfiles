local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
  return
end

github_theme.setup({
  theme_style = "dimmed",
  transparent = "true",
  dark_sidebar = false,
})
