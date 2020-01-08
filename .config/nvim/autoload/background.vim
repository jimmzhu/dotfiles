" Toggle between light and dark backgrounds
function! background#ToggleBackground(...)
  let lightColorscheme = get(a:, 1, 0)
  let darkColorscheme = get(a:, 2, 0)

  if &background == 'light'
    execute ":set background=dark"
    if a:0 == 2
      execute ":colorscheme " . darkColorscheme
    endif
  else
    execute ":set background=light"
    if a:0 == 2
      execute ":colorscheme " . lightColorscheme
    endif
  endif
endfunction
