set shell=/bin/bash

" ----------------------VISUAL SETTINGS----------------------
syntax on
filetype on                                  " Enable filetype detection
filetype indent on                           " Enable filetype-specific indenting
filetype plugin on                           " Enable filetype-specific plugins
set encoding=utf-8                           " Encoding
set ruler                                    " Adds ruler to status line
set number                                   " Adds line numbers
set cursorline                               " Highlights current cursor line
set nocompatible                             " Don't try to be vi compatible
set noswapfile                               " Disable swap files
set nobackup                                 " No backup file while editing
set nowritebackup                            " No backup file while editing
set wildmenu                                 " Commands tab complete
set wildmode=list:longest,full               " Commands tab complete
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Skip Searching files matching pattern
set nofoldenable                             " Disable folding
set clipboard=unnamed                        " Use system clipboard for copy/paste
set ttyfast                                  " Fast Scrolling
set listchars=tab:▸\ ,eol:¬                  " Visualize tabs & newline
map <leader>l :set list!<CR>                 " Toggle tabs and EOL
set completeopt=menuone,longest
set foldmethod=indent
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set tags=./.tags;,~/.vimtags;./tags


" ----------------------WHITESPACE----------------------
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
set smartindent
" When vim ecounters a rb file, switch to two tabs.
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab


" ----------------------CURSOR MOTION----------------------
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>              " use % to jump between pairs
runtime! macros/matchit.vim      " switch among e.g. if/elsif/else/end


" ----------------------SEARCHING----------------------
set hlsearch        " highlight all search hits
set incsearch       " incremental searching
set ignorecase      " ignore case
set smartcase       " matches is uppercase letter is searched
set showmatch       " See opening & closing parenthesis/ brackets
set history=200
map <leader><space> :let @/=''<cr> " clear search


" ----------------------PLUGINS----------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'ekalinin/Dockerfile.vim'
Bundle 'vim-ruby/vim-ruby'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required


" --------------------COLOR SCHEME & THEME--------------------
set t_Co=256
colorscheme solarized
let g:solarized_termcolors=256
set background=dark " for the dark version
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1


" --------------------PLUGINS SETTING--------------------
" Config for indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" autocomplete window color for plugin YouCompleteMe
highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=green ctermbg=black
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
