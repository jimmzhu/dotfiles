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
    colorscheme base16-ateliercave  " colorscheme @ ~/.vim/colors
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
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig,*.o

" ----------------------------------------------------------------------------
"  Plugins
" ----------------------------------------------------------------------------

let g:airline_powerline_fonts = 1   " enable powerline font symbols
let g:CommandTMaxHeight=12          " limit rows for Command-T
let g:CommandTMatchWindowReverse=0  " show matched file at top of match window
let g:ycm_allow_changing_updatetime = 0
let g:tagbar_autoclose = 1          " auto-close tagbar window on tag selection

" Plugins to consider:
" snipmate

" TODO:
" maxbrunsfeld/vim-emacs-bindings
" figure out sessions
" make vim-vinegar open in new split and target current split

call plug#begin('~/.vim/plugged')
"Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'wincent/Command-T', { 'do': 'cd ruby/command-t && ruby extconf.rb && make' }
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kchmck/vim-coffee-script'
Plug 'flazz/vim-colorschemes'
Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'derekwyatt/vim-scala'
Plug 'slim-template/vim-slim'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

filetype plugin indent on

" ----------------------------------------------------------------------------
"  Key Mappings
" ----------------------------------------------------------------------------

let mapleader = " "
noremap <silent> <C-M-n> <Esc>:edit .<CR>

" FILE SEARCHING
""""""""""""""""""""
nnoremap <Leader>f :Ggrep<Space>
nnoremap <silent> <Leader>o :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
nnoremap <silent> <Leader>l :TagbarToggle<CR>
"noremap <silent> <F5> :PlugInstall!<CR>

noremap ; :

" BASIC NAVIGATION
""""""""""""""""""""
"Shift   = high-level navigation   (1/2 page, start/end of line)
noremap H ^
nnoremap L $
vnoremap L g_
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
vnoremap <silent> } :<C-u>call motion#EndBlock(1)<CR>
vnoremap <silent> { :<C-u>call motion#StartBlock(1)<CR>

" TABS
""""""""""""""""""""
noremap ( gT
noremap ) gt
nnoremap <silent> <C-M-w> :tabmove -1<CR>
nnoremap <silent> <C-M-e> :tabmove +1<CR>
vnoremap <silent> <C-M-w> :<C-u>tabmove -1<CR>
vnoremap <silent> <C-M-e> :<C-u>tabmove +1<CR>

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
vnoremap s r
nnoremap S R

" CHANGE IN TWEAKS
""""""""""""""""""""
nnoremap ci( f)ci)
nnoremap ci{ f}ci}
nnoremap ci[ f]ci]
nnoremap ci< f>ci>
" use ci<Space>, di<Space>, yi<Space> for ciW, diW, yiW
onoremap i<Space> iW

" CODING HOTKEYS
""""""""""""""""""""
" tab indenting/unindenting
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<

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
nnoremap <silent> \ v:<C-u> call comments#ToggleComments()<CR>
vnoremap <silent> \ :<C-u> call comments#ToggleComments()<CR>

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
noremap <silent> <C-\> :<C-u> call background#ToggleBackground()<CR>

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
" remember folding
autocmd BufWinLeave *.vimrc mkview!
autocmd BufWinEnter *.vimrc silent loadview
" load last session if available (update on close)
" (doesn't play well with YouCompleteMe)
autocmd VimEnter * nested :call sessions#LoadSession()
autocmd VimLeave * :call sessions#UpdateSession()
nnoremap <leader>a :call sessions#MakeSession()<CR>
vnoremap <leader>a :<C-u>call sessions#MakeSession()<CR>

" open quickfix window after greps
autocmd QuickFixCmdPost *grep* cwindow
" don't expand tabs for make files
autocmd FileType make setlocal noexpandtab

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc call sessions#UpdateVimrc()
augroup END
