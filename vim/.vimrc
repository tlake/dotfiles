" ================================
" VIM PLUGINS
" ================================

" Install vim-plug plugin manager if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins (command: `:PlugInstall`)
"
" Note: this automatically executes the following:
" filetype plugin indent on
" syntax enable
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'python-mode/python-mode'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'w0rp/ale'
call plug#end()

" ======== Plugin Options ========

" pymode
let g:pymode_lint_ignore = "E501,E0100"
let g:pymode_python = "python3"
let g:pymode_options_colorcolumn = 0
let g:pymode_folding = 0

" terraform
let g:terraform_align = 1

" gitgutter
let g:gitgutter_max_signs = 9999

" write.vim
noremap <leader>w :Write
set runtimepath+=$HOME/.vim/write.vim

" pangloss/vim-javascript
let g:javascript_plugin_flow = 1

" mxw/vim-jsx
let g:jsx_ext_required = 0

" w0rp/ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\}
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" OLD PATHOGEN PLUGIN INIT:
" runtime bundle/vim-pathogen/autoload/pathogen.vim
" execute pathogen#infect()

" ================================
" DEFAULT SETTINGS
" ================================

" ======== Config ========

let mapleader = ","

autocmd FocusLost * :wa

set autoindent
set background=dark
set backspace=indent,eol,start
set cursorline
set expandtab
set encoding=utf-8
set hidden " Keep undo after buffer switch
set linebreak
set mouse=a
set nocompatible
set number
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set showmode
set softtabstop=4
set tabstop=4
set visualbell
set wildmenu
set wildmode=list:longest
set ttyfast

nnoremap ; :

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" The modelines bit prevents some security exploits having to do with
" modelines in files. I never use modelines so I don’t miss any
" functionality here.
set modelines=0

" Get rid of that stupid goddamned help key that you will invaribly
" hit constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Enforce hjkl movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Automatically inserting a \v before any string you search for. This
" turns off Vim’s crazy default regex characters and makes searches use
" normal regexes.
nnoremap / /\v
vnoremap / /\v

" ignorecase and smartcase together make Vim deal with case-sensitive
" search intelligently. If you search for an all-lowercase string your
" search will be case-insensitive, but if one or more characters is
" uppercase the search will be case-sensitive.
set ignorecase
set smartcase

" gdefault applies substitutions globally on lines. For example, instead
" of :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what
" you want (when was the last time you wanted to only replace the first
" occurrence of a word on a line?) and if you need the previous behavior
" you just tack on the g again.
set gdefault

" highlight search results (as you type)
set incsearch
set showmatch
set hlsearch

" The <leader><space> mapping makes it easy to clear out a search by
" typing ,<space>.
nnoremap <leader><space> :noh<cr>

" Make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" ======== Operations ========

" Filetype coersion
autocmd BufNewFile,BufRead *.mush,*.mux setfiletype mush
autocmd BufNewFile,BufRead *.adoc       setfiletype asciidoc

" Commenting blocks of code
autocmd FileType c,cpp,java,scala,go,js,jsx         let b:comment_leader = '// '
autocmd FileType sh,ruby,python,yaml,yml,conf,fstab let b:comment_leader = '# '
autocmd FileType tex                                let b:comment_leader = '% '
autocmd FileType mail                               let b:comment_leader = '> '
autocmd FileType vim                                let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Formatting files
autocmd FileType go let b:format_command = 'GoImports'
autocmd FileType tf,tfvars let b:format_command = 'TerraformFmt'
autocmd FileType json let b:format_command = ':%!python -m json.tool'
noremap ff :execute b:format_command<CR>
noremap FF :execute b:format_command<CR>:w<CR>

" Use H and L to switch buffers
map H :bp<Return>
map L :bn<Return>

" ctrl+n shortcut for norm
vnoremap <C-n> :norm<Space>

" ======== Appearance ========

colorscheme monokai
set laststatus=2
set statusline=%f
set wrap
set textwidth=0
set wrapmargin=0
set formatoptions=qrn1
highlight ColorColumn ctermbg=Black

" ================================
" FILETYPE OVERRIDES
" ================================

" *.py settings
autocmd BufNewFile,BufRead *.py setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
    \ encoding=utf-8
"

" *.js, *.jsx settings
autocmd BufNewFile,BufRead *.js,*.jsx setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
    \ encoding=utf-8

" actually maybe don't automatically fix errors on write
" autocmd BufWritePost *.js,*.jsx AsyncRun -post=checktime /usr/local/bin/eslint --fix %
" autocmd BufWritePost *.js,*.jsx AsyncRun -post=checktime /usr/local/bin/eslint %

"
autocmd FileType yaml setlocal
    \ ts=2
    \ sts=2
    \ sw=2
    \ expandtab
"
