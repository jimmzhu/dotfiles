" Toggle between light and dark backgrounds
function! background#ToggleBackground()
  if &background == 'light'
    execute ":set background=dark"
  else
    execute ":set background=light"
  endif
endfunction
