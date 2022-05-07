vim.cmd [[
  try
    let g:onedark_config = {
      \ "style": "darker",
      \ "transparent": v:true,
      \ "code_style" : {
          \ "keywords": "bold",
          \ "functions": "italic,bold",
          \ "variables": "bold",
      \ },
      \ "diagnostics": {
        \ "darker": v:false,
        \ "background": v:false,
      \ },
    \ }

    colorscheme onedark
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
