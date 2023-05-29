" BASIC NAVIGATION
""""""""""""""""""""
"Shift   = high-level navigation   (1/2 page, start/end of line)
noremap H ^
nnoremap L $
vnoremap L g_
noremap J <C-d>
noremap K <C-u>

" scrolling
noremap F <C-e>
noremap R <C-y>

" make b work like F
noremap b F

" COMMAND MODE
""""""""""""""""""""
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <S-Left>
cnoremap <C-l> <S-Right>

" TABS
""""""""""""""""""""
noremap ( gT
noremap ) gt
noremap [5^ gT
noremap [6^ gt
nnoremap <silent> <C-S-(> :tabmove -1<CR>
nnoremap <silent> <C-S-)> :tabmove +1<CR>
vnoremap <silent> <C-S-(> :<C-u>tabmove -1<CR>
vnoremap <silent> <C-S-)> :<C-u>tabmove +1<CR>

" SPLITS
""""""""""""""""""""
nnoremap <silent> <C-M-d> :q<CR>
noremap <silent> <C-M-h> <C-w>h
noremap <silent> <C-M-l> <C-w>l
noremap <silent> <C-M-j> <C-w>j
noremap <silent> <C-M-k> <C-w>k
noremap <silent> <leader>r <C-w>r
noremap <silent> <leader>e <C-w>=
noremap <silent> <leader>v <Esc>:vsplit<CR>
noremap <silent> <leader>t <Esc>:tabedit %<CR>
noremap <silent> <leader>s <Esc>:split<CR>
noremap <silent> < <C-w>h
noremap <silent> > <C-w>l
"noremap <silent> <leader>, :wincmd j<CR>
"noremap <silent> <leader>. :wincmd k<CR>
"noremap <silent> <leader>, :vsplit<CR>

" PREVIOUS DOCUMENT
""""""""""""""""""""
noremap <silent> <Backspace> <C-S-^>

" JUMPING
""""""""""""""""""""
"maybe use gh, gl for tabs?
noremap g. g;`.
noremap gj G
noremap gk gg
"use G for even bigger jumps... GK, GJ, GH, GL?
"noremap G <Nop>

" SYSTEM CLIPBOARD PASTE
""""""""""""""""""""
inoremap <C-v> <Esc>"+p
noremap <silent> <leader>p "0p
noremap <silent> <leader>P "0P

" YCD TWEAKS
""""""""""""""""""""
" make C and D behave like Y (weird right?)
nnoremap Y yy
nnoremap C cc
nnoremap D dd
" make yh, yl, ch, cl, dh, dl do useful things
onoremap h ^
onoremap l $
" further mods
nnoremap yh y0
nnoremap dip vipjd
" remap swap
nnoremap s r
vnoremap s r
nnoremap S R

" CHANGE IN TWEAKS
""""""""""""""""""""
nnoremap ci) f)ci)
nnoremap ci} f}ci}
nnoremap ci] f]ci]
nnoremap ci> f>ci>
" use ci<Space>, di<Space>, yi<Space> for ciW, diW, yiW
onoremap i<Space> iW

" CODING HOTKEYS
""""""""""""""""""""
" tab indenting/unindenting
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<
" use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" MACRO MAGIC
""""""""""""""""""""
" search, replace for highlighted text (backslashes not supported)
vnoremap <silent> * <Esc>/\V<C-r>*/<CR>
vnoremap <C-F> <Esc>:%s/\V<C-r>*//gc<Left><Left><Left>
" change global double quotes to single quotes
nnoremap <silent> cg" :%s/\v\"([^\n\"'#]*)\"/'\1'/gc<CR>
nnoremap <silent> c" :s/\v\"([^\n\"'#]*)\"/'\1'/g<CR>:noh<CR>
nnoremap <silent> c' :s/\v'([^\n\"']*)'/\"\1\"/g<CR>:noh<CR>
"universal comment toggler: regex OP
"BONUS: it doesn't clutter up your /search history now

" SPECIAL INSERTS
""""""""""""""""""""
"for symmetry:
"noremap i i
"noremap I I
nnoremap o a
nnoremap O A

nnoremap <CR> o
nnoremap <S-CR> O

" MISCELLANEOUS
""""""""""""""""""""
nnoremap ^ J
"noremap ) %
"noremap ( %

" explicit nnoremap and vnoremap
" so that onoremap doesn't get overwritten
nnoremap <silent> a :w<CR>

nnoremap <silent> <Esc> :noh<CR><Esc>
vnoremap <silent> <Esc> <Esc>:noh<CR>
noremap r <Esc><C-r>

"remember this for surround:
":s/\(\S\+\)/"\1"/

"Steven's experiments
"TODO: default to auto-toggle paragraph or code block
"nnoremap <silent> <C-space> :call ToggleFold()<CR>
"vnoremap <C-space> zf
