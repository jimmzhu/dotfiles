set nocompatible                     " don't be compatible with Vi

" miscellaneous options
set autoread                        " autoread changes from outside vim (git)
set hidden                          " hides buffers (when opening a new file)
set history=500                     " remember more command/search history
set undolevels=500                  " remember more actions to undo
set scrolloff=3                     " keeps cursor within 3 lines of screen
set nobackup                        " no backup before overwriting a file
set noswapfile                      " no silly swapfiles
set list listchars=tab:→\ ,trail:·  " show unwanted whitespace
set nowrap                          " do not wrap lines longer than window
set whichwrap+=h,l                  " wrap h and l when at start or end of line
set ssop=curdir,folds,tabpages      " exclude 'options' from session options
set updatetime=300                  " use shorter update time for autocompletion
"set signcolumn=number               " merge sign column and number column
" searching
set incsearch                       " show search matches as you type
set hlsearch                        " highlight search terms
set ignorecase                      " ignore case when searching
set smartcase                       " don't ignore case for capitalized search
" tabs                              see http://tedlogan.com/techblog3.html
set autoindent                      " allow autoindenting
set tabstop=4                       " tabs are 4 columns wide
set softtabstop=4                   " number of cols that hitting <Tab> creates
set shiftwidth=2                    " [auto]indenting indents 2 columns
set expandtab                       " tabs insert spaces instead
set smarttab                        " tabbing at start of line uses shiftwidth
" ----------------------------------------------------------------------------
"  GUI
" ----------------------------------------------------------------------------

    " font
    set guifont=Inconsolata\ 14
    " colorscheme
    set t_Co=256                    " 256 colors in terminal
    syntax enable                   " enable syntax highlighting
    set background=dark             " dark background
    colorscheme Atelier_SeasideDark " colorscheme @ ~/.config/nvim/colors
    " guides
    set number                      " line numbers
    set title                       " set window title
    set cursorline                  " highlight cursor row
    set textwidth=80
    set colorcolumn=80,100          " highlight 80th and 100th columns
    " statusbar, menubar, commandline
    set laststatus=2                " always show statusbar
    set guioptions=aegit            " get rid of menu
    set showcmd                     " shows command as you type
    set showmode                    " shows what mode you're in
    set wildmenu                    " enhanced command line completion
    set mouse=a                     " enable mouse for vim
    " splits
    set splitbelow                  " open new splits below current
    set splitright                  " open new splits right of current
    set equalalways                 " split sub-windows equally
    set fillchars+=vert:\           " use space instead of | to mark vsplit

" ----------------------------------------------------------------------------

" files to ignore when searching
set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/env/*
set wildignore+=*/vendor/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/chef/*
set wildignore+=*/coverage/*
set wildignore+=*/node_modules/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig,*.o,*.pyc

" set completeopt to be what ncm2 expects
set completeopt=noinsert,menuone,noselect

" Use ~/.config/nvim/tmp rather than /tmp to avoid unexpected clean ups
let $TMPDIR = "~/.config/nvim/tmp"

" ----------------------------------------------------------------------------
"  Plugins
" ----------------------------------------------------------------------------

let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:coc_fzf_opts = ['--layout=reverse']
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-pyright'
  \ ]
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 } }
let g:nnn#layout = { 'window': { 'width': 0.8, 'height': 0.5 } }
let g:nnn#set_default_mappings = 0
let g:nnn#action = {
  \ }
let g:airline_theme = 'zenburn'
let g:airline_powerline_fonts=1     " enable powerline font symbols
let g:airline_section_y=''          " don't show file encoding
let g:tagbar_autoclose=1            " auto-close tagbar window on tag selection

"let g:NERDTreeQuitOnOpen=1          " auto-close nerdtree on open
"let g:NERDTreeMinimalUI=1
"let g:LanguageClient_serverCommands = {
"    \ 'javascript': ['javascript-typescript-stdio'],
"    \ 'typescript': ['javascript-typescript-stdio'],
"    \ 'python': ['pyls'],
"    \ }
"let g:LanguageClient_rootMarkers = {
"    \ 'javascript': ['jsconfig.json'],
"    \ 'typescript': ['tsconfig.json'],
"    \ }

" Plugins to consider:
" snipmate, ultisnips

call plug#begin('~/.config/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
"Plug 'm-kat/aws-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

"Syntax plugins
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"Plug 'pangloss/vim-javascript'
"Plug 'elzr/vim-json'
"Plug 'digitaltoad/vim-pug'
"Plug 'tpope/vim-rails'
"Plug 'vim-ruby/vim-ruby'
"Plug 'derekwyatt/vim-scala'
"Plug 'slim-template/vim-slim'
"Plug 'wavded/vim-stylus'
"Plug 'stephpy/vim-yaml'

"Disabled plugins
"Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdtree'
"
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-path'
"Plug 'roxma/nvim-yarp'

call plug#end()

filetype plugin indent on

" ----------------------------------------------------------------------------
"  Key Mappings
" ----------------------------------------------------------------------------

let mapleader = " "

" FILE SEARCHING
""""""""""""""""""""
nnoremap <Leader>f :FzfRg<Space>
nnoremap <silent> <Leader>o :FzfFiles<CR>
nnoremap <silent> <Leader>b :FzfGFiles?<CR>
nnoremap <silent> <Leader>\ :FzfColors<CR>
nnoremap <silent> <Leader>l :TagbarOpenAutoClose<CR>
nnoremap <silent> - :NnnPicker %:p:h<CR>

noremap ; :

" LANGUAGE SERVER
""""""""""""""""""""
nnoremap <silent> <Leader><Leader> :call CocAction('doHover')<CR>
nmap <silent> <C-Space> <Plug>(coc-codeaction)
nmap <silent> S <Plug>(coc-rename)
"TODO: combined go to definition / references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gE <Plug>(coc-diagnostic-prev)
xmap <silent> <Leader><Leader> <Plug>(coc-range-select)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" use <TAB> to navigate the popup menu and <CR> to confirm:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
noremap <silent> <Leader>; :<C-u>CocFzfList commands<CR>
noremap <silent> <Leader>e :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <C-o><C-o> :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

" BASIC NAVIGATION
""""""""""""""""""""
"Shift   = high-level navigation   (1/2 page, start/end of line)
noremap H ^
nnoremap L $
xnoremap L g_
noremap J <C-d>
noremap K <C-u>

"Control = medium level/context-aware navigation (paragraphs, words)
nnoremap <silent> <C-h> :call motion#PrevWord(0)<CR>
nnoremap <silent> <C-l> :call motion#NextWord(0)<CR>
vnoremap <silent> <C-h> :<C-u>call motion#PrevWord(1)<CR>
vnoremap <silent> <C-l> :<C-u>call motion#NextWord(1)<CR>
nnoremap <silent> <C-j> :call motion#NextPara(0)<CR>
nnoremap <silent> <C-k> :call motion#PrevPara(0)<CR>
vnoremap <silent> <C-j> :<C-u>call motion#NextPara(1)<CR>
vnoremap <silent> <C-k> :<C-u>call motion#PrevPara(1)<CR>

" scrolling
noremap F <C-e>
noremap R <C-y>

" make b work like F
noremap b F

" needs improvement -- check out Tag Bar
nnoremap <silent> } :call motion#EndBlock(0)<CR>
nnoremap <silent> { :call motion#StartBlock(0)<CR>
xnoremap <silent> } :<C-u>call motion#EndBlock(1)<CR>
xnoremap <silent> { :<C-u>call motion#StartBlock(1)<CR>

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
noremap <silent> ( gT
noremap <silent> ) gt
noremap <silent> [5^ gT
noremap <silent> [6^ gt
nnoremap <C-S-(> :tabmove -1<CR>
nnoremap <C-S-)> :tabmove +1<CR>
vnoremap <C-S-(> :<C-u>tabmove -1<CR>
vnoremap <C-S-)> :<C-u>tabmove +1<CR>

" SPLITS
""""""""""""""""""""
noremap <silent> <C-M-d> <Esc>:q<CR>
noremap <silent> <C-M-h> <C-w>h
noremap <silent> <C-M-l> <C-w>l
noremap <silent> <C-M-j> <C-w>j
noremap <silent> <C-M-k> <C-w>k
noremap <silent> <leader>d <Esc>:q<CR>
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
"nnoremap Y yy
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
xnoremap s r
"nnoremap S R

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
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" MACRO MAGIC
""""""""""""""""""""
" search, replace for highlighted text (backslashes not supported)
xnoremap <silent> * <Esc>/\V<C-r>*/<CR>
xnoremap <C-F> <Esc>:%s/\V<C-r>*//gc<Left><Left><Left>
" change global double quotes to single quotes
nnoremap <silent> cg" :%s/\v\"([^\n\"'#]*)\"/'\1'/gc<CR>
nnoremap <silent> c" :s/\v\"([^\n\"'#]*)\"/'\1'/g<CR>:noh<CR>
nnoremap <silent> c' :s/\v'([^\n\"']*)'/\"\1\"/g<CR>:noh<CR>
"universal comment toggler: regex OP
"BONUS: it doesn't clutter up your /search history now
nnoremap <silent> \ v:<C-u> call comments#ToggleComments()<CR>
xnoremap <silent> \ :<C-u> call comments#ToggleComments()<CR>

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
noremap <silent> <C-\>
  \ :<C-u> call background#ToggleBackground('Atelier_SeasideLight', 'Atelier_SeasideDark')<CR>

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

" ----------------------------------------------------------------------------
"  Autocommands
" ----------------------------------------------------------------------------

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" auto-set indentation based on file type
autocmd FileType python setlocal shiftwidth=4
autocmd FileType java setlocal shiftwidth=4
autocmd FileType c setlocal shiftwidth=4
autocmd FileType cpp setlocal shiftwidth=4

" unmap modifying keys for nonmodifiable files
"autocmd BufReadPost * if !&modifiable
"                      \ | execute ":nnoremap <buffer> <CR> <CR>"
"                      \ | nnoremap <buffer> o <CR>

" auto-remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e
" remember folding for .vimrc
"autocmd BufWinLeave *.vimrc mkview!
"autocmd BufWinEnter *.vimrc silent loadview
"augroup myvimrchooks
"    au!
"    autocmd bufwritepost .vimrc call sessions#UpdateVimrc()
"augroup END

" load last session if available (update on close)
autocmd VimEnter * nested :call sessions#LoadSession()
autocmd VimLeave * :call sessions#UpdateSession()
nnoremap <leader>a :call sessions#MakeSession()<CR>
xnoremap <leader>a :<C-u>call sessions#MakeSession()<CR>

" open quickfix window after greps
autocmd QuickFixCmdPost *grep* cwindow
" don't expand tabs for make files
autocmd FileType make setlocal noexpandtab

if has('nvim')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
