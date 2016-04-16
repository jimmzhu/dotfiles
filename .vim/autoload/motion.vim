" getpos('.') in visual mode is buggy; always returns start of selection
" if visual mode, escape and return getpos('.') where cursor actually is
function! CurrPos(visualMode)
    if a:visualMode
        normal! gv
        execute "normal! \<Esc>"
        let currPos = getpos('.')
        normal! gv
        return currPos
    else
        return getpos('.')
    endif
endfunction

" Search forward for next word, skipping over punctuation
function! motion#NextWord(visualMode)
    " 'W' = don't wrap search, default = forward
    " if search reached end of file, go to end of file
    if searchpos("\\<\\w\\w*\\>", 'W') == [0,0]
        normal! G$
    endif

    " gv then <Esc> ensures that searchpos searches properly in visual mode
    if a:visualMode
        execute "normal! gv\<Esc>"
        if searchpos("\\<\\w\\w*\\>", 'W') == [0,0]
            normal! gvG$
            return
        endif

        normal! gv
        " if the cursor is at the end of the selection
        if getpos("'>") == CurrPos(a:visualMode)
            execute "normal! /\\<\\w\\w*\\>/e\<CR>"
        else
            execute "normal! /\\<\\w\\w*\\>\<CR>"
        endif
        execute "normal! :\<C-u>noh\<CR>"
        normal! gv
    endif
endfunction

" Search backward for previous word, skipping over punctuation
function! motion#PrevWord(visualMode)
    " 'W' = don't wrap search, 'b' = backward
    " if search reached start of file, go to start of file
    if searchpos("\\<\\w\\w*\\>", 'bW') == [0,0]
        normal! gg
    endif

    " gv then <Esc> ensures that searchpos searches properly in visual mode
    if a:visualMode
        execute "normal! gv\<Esc>"
        if searchpos("\\<\\w\\w*\\>", 'bW') == [0,0]
            normal! gvgg0
            return
        endif
        " if the cursor is at the start of the selection
        if getpos("'<") == CurrPos(a:visualMode)
            normal! gv
            execute "normal! ?\\<\\w\\w*\\>\<CR>"
        else
            execute "normal! gv\<Esc>"
            if searchpos("\\<\\w\\w*\\>", 'bWe') != [0,0]
                normal! gv
                execute "normal! ?\\<\\w\\w*\\>?e\<CR>"
            else
                " this code gets executed uber rarely, in case we're in
                " the 1st word in file but cursor is at end of selection
                normal! gvgg0
            endif
        endif
        execute "normal! :\<C-u>noh\<CR>"
        normal! gv
    endif
endfunction

" Search forward for empty lines (which act as paragraph delimiters)
function! motion#NextPara(visualMode)
    " 'W' = don't wrap search, default = forward, 'e' = go to end of match
    " if search reached end of file, go to end of file
    if searchpos('\v(\n\s*([/#%].*|\W*)?$)+\n\s*\S', 'eW') == [0,0]
        normal! G^
    endif

    " gv then <Esc> ensures that searchpos searches properly in visual mode
    if a:visualMode
        execute "normal! gv\<Esc>"
        if searchpos('\v(\n\s*([/#%].*|\W*)?$)+\n\s*\S', 'W') == [0,0]
            normal! gvG$
        else
            normal! gv
            execute "normal! /\\v(\\n\\s*([/#%].*|\\W*)?$)+\\n\\s*\\S/\<CR>"
            execute "normal! :\<C-u>noh\<CR>"
            normal! gv$
        endif
    endif
endfunction

" Search backward for empty lines (which act as paragraph delimiters)
function! motion#PrevPara(visualMode)
    " 'W' = don't wrap search, 'b' = backward, 'e' = go to end of match
    " if search reached start of file, go to start of file
    " normal! 0 prevents search from returning the current line
    normal! 0
    if searchpos('\v(\n\s*([/#%].*|\W*)?$)+\n\s*\S', 'beW') == [0,0]
        normal! gg
    endif

    " gv then <Esc> ensures that searchpos searches properly in visual mode
    if a:visualMode
        execute "normal! gv\<Esc>"
        normal! 0
        if searchpos('\v(\n\s*([/#%].*|\W*)?$)+\n\s*\S', 'beW') == [0,0]
            normal! gvgg0
        else
            normal! gv
            execute "normal! 0?\\v(\\n\\s*([/#%].*|\\W*)\\?$)+\\n\\s*\\S?e\<CR>"
            execute "normal! :\<C-u>noh\<CR>"
            normal! gv0
        endif
    endif
endfunction

" Line('.') in visual mode is unreliable; always returns top line
function! CurrLine(visualMode)
    " if visual mode, escape and return line('.') where cursor actually is
    if a:visualMode
        normal! gv
        execute "normal! \<Esc>"
        let currLine = line('.')
        normal! gv
        return currLine
    else
        return line('.')
    endif
endfunction

function! motion#EndBlock(visualMode)
    let currRow = CurrLine(a:visualMode)
    let currIndent = IndentNumber(currRow, 'b')
    if currIndent == IndentNumber(currRow+1, 'f')
        let currIndent = currIndent - 4
        if currIndent < 0
            let currIndent = 0
        endif
    endif
    " search forward for a line that has indentation <= to current indent
    " 'W' means don't wrap search, default direction is forward
    " [^ /#"%%] means skip blank lines and comment lines
    " if search reached end of file, go to end of file
    " gv then <Esc> ensures that searchpos searches properly in visual mode
    if a:visualMode
        execute "normal! gv\<Esc>"
    endif
    if searchpos(printf("^ \\{0,%d\\}[^ /#\"%%]", currIndent), 'W') == [0,0]
        normal! G^
        if a:visualMode
            normal! gvG$
        endif
        return
    endif
    normal! ^

    if a:visualMode
        normal! gv
        execute printf("normal! /^ \\{0,%d\\}[^ \\/#\"%%]\<CR>", currIndent)
        execute "normal! :\<C-u>noh\<CR>"
        normal! gv$
    endif
endfunction

function! motion#StartBlock(visualMode)
    let currRow = CurrLine(a:visualMode)
    let currIndent = IndentNumber(currRow, 'f')
    if currIndent == IndentNumber(currRow-1, 'b')
        let currIndent = currIndent - 4
        if currIndent < 0
            let currIndent = 0
        endif
    endif
    " search backward for a line that has indentation <= to current indent
    " 'W' means don't wrap search, 'b' means backward search direction
    " [^ /#\"%%] means skip blank lines and comment lines
    " if search reached start of file, go to start of file
    " gv then <Esc> ensures that searchpos searches properly in visual mode
    " normal! 0 prevents search from returning the current line
    if a:visualMode
        execute "normal! gv\<Esc>"
    endif
    normal! 0
    if searchpos(printf("^ \\{0,%d\\}[^ /#\"%%]", currIndent),'bW') == [0,0]
        normal! gg
        if a:visualMode
            normal! gvgg0
        endif
        return
    endif
    normal! ^

    if a:visualMode
        normal! gv
        execute printf("normal! 0?^ \\{0,%d\\}[^ /#\"%%]\<CR>", currIndent)
        execute "normal! :\<C-u>noh\<CR>"
        normal! gv0
    endif
endfunction

function! IndentNumber(line, dir)
    " if empty or non-existent line or comment line...
    if getline(a:line) =~ '^\s*$' || getline(a:line) =~ '^\s*[/#%"]'
        " move backwards and return indent of first non-empty line
        if a:dir ==# 'b' && a:line > 1
            return IndentNumber(a:line-1, 'b')
        " move forwards and return indent of first non-empty line
        else
            if a:dir ==# 'f' && a:line < line('$')
                return IndentNumber(a:line+1, 'f')
            endif
        endif
    endif
    return indent(a:line)
endfunction
