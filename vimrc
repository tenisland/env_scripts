" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

"""""
" Ned: duplicated" filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Ned: example line" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Ned: additional
"Plugin 'fatih/vim-go'
"Plugin 'scrooloose/nerdtree'
Plugin 'preservim/nerdtree'
Plugin 'SrcExpl'
Plugin 'taglist.vim'
Plugin 'AutoComplPop'
" Ned:too old Plugin 'xolox/vim-easytags'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
" Do these gutentags and tagbar conflict?

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" recommendation from https://brunch.co.kr/@kmbmjn95/49
Plugin 'frazrepo/vim-rainbow'
"Plugin 'nvie/vim-flake8'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'machakann/vim-highlightedyank'
Plugin 'osyo-manga/vim-anzu'
Plugin 'itchyny/vim-cursorword'

" Theme 
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Ned: duplicated" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" window size
set lines=40
set columns=120

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
" Ned nnoremap / /\v
" Ned vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
"
" Directory /usr/share/vim/vim81/colors/
" contains themes/colorschemes
"colorscheme industry
colorscheme solarized
set clipboard=exclude:.*

" Ned custom keymap @ 2020.11.23
nmap nerd :NERDTreeToggle<CR>
nmap tlist :TlistToggle<CR>
let NERDTreeWinPos = "left"
"nmap <F7> :NERDTree<CR>
"nmap <F8> :TlistToggle<CR>

" set ctags path for taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0

" Tag list on right
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_WinWidth = 32

"set tags=/wv/medkr_p/99_nkim/4_kernel/linux-5.9/tags
"" Tag Bar Setting
nmap <F8> :TagbarToggle<CR>       " F8 Key = Tagbar Toggling

"filetype on
let g:tagbar_width = 35

"" vim-gutentags
let g:gutentags_project_root = ['.tag_root']
let g:gutentags_project_info = []

" ctags db setting 
" result of ctags -R 
if filereadable("./tags")
    set tags=./tags
endif

" cscope setting https://tear94fall.github.io/lecture/2020/03/03/vim-ctags-cscope-taglist.html
set csprg=/usr/bin/cscope
set csto=0
"set cst
set nocst
set nocsverb

if filereadable("./cscope.out")
    cs add cscope.out
else
    "cs add /usr/user/workspace/project/cscope.out
endif
set csverb

" Not used now "" YouCompleteMe
" Not used now let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" Not used now let g:ycm_autoclose_preview_window_after_completion = 1
" Not used now nnoremap <C-p> :YcmCompleter GoTo<CR>
" Not used now 
" Not used now "" vim-clang-format
" Not used now autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" Not used now autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Not used now nmap <Leader>C :ClangFormatAutoToggle<CR>
" Not used now let g:clang_format#auto_format = 0
