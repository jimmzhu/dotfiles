" Comment/Uncomment the selection in visual mode
function! comments#ToggleComments()
  " go to a non-empty line within the selection
  let currLine = line("'<")
  while currLine <= line("'>") && getline(currLine) =~ '^\s*$'
    let currLine = currLine + 1
  endwhile
  " if all empty lines, then do nothing
  if currLine > line("'>")
    return
  endif

  " assume visual mode, so restore selection
  normal! gv

  " if comment line (starts w/ comment char), remove comment character(s)
  if getline(currLine) =~ '^[/#%"]'
    execute "normal! :s!^[/#%\"][/]*!!\<CR>:noh\<CR>"
    return 0
  endif

  let fSuffix = split(@%, '\.')[-1]

  if fSuffix =~ 'vim'
    " .vimrc, .gvimrc, .vimperatorrc
    execute "normal! :s!^!\"!\<CR>"
  elseif fSuffix == 'm'
    " .m (Matlab)
    execute "normal! :s!^!%!\<CR>"
  elseif index(['c', 'cpp', 'h', 'cs', 'java', 'js', 'jsx', 'scala',
              \ 'css', 'scss', 'sass', 'less'], fSuffix) >= 0
    " c++-style comments //
    execute "normal! :s!^!//!\<CR>"
  else
    " default: shell-style comments #
    execute "normal! :s!^!#!\<CR>"
  endif

  " clear highlights
  execute 'normal! :noh\<CR>'
endfunction
