" automatically load and save session on start/exit.
" Modified by robin burchell <w00t@inspircd.org>
" to only load/save sessions if started with no arguments.

" Create a session
function! sessions#MakeSession()
    if g:sessionfile != ""
        if (filewritable(g:sessiondir) != 2)
            exe 'silent !mkdir -p ' g:sessiondir
            redraw!
        endif
        exe "mksession! " . g:sessionfile
        echo "Session Saved."
    else
        " TODO: prompt user to override and save session anyway
        echo "Session not saved."
    endif
endfunction

" Updates a session if it already exists
function! sessions#UpdateSession()
    if (g:sessionfile != "" && filereadable(g:sessionfile))
        exe "mksession! " . g:sessionfile
        echo "Session Saved."
    endif
endfunction

" Loads a session if it exists
function! sessions#LoadSession()
    if argc() == 0
        let g:sessiondir = $HOME . "/.vim/sessions" . getcwd()
        let g:sessionfile = g:sessiondir . "/session.vim"
        if (filereadable(g:sessionfile))
            exe 'source ' g:sessionfile
        else
            echo "No session loaded."
        endif
    else
        let g:sessionfile = ""
        let g:sessiondir = ""
    endif
endfunction

function! sessions#UpdateVimrc()
    for server in split(serverlist())
        call remote_send(server, '<Esc>:source $HOME/.vimrc<CR>')
    endfor
endfunction
