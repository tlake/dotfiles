runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" pymode options
let g:pymode_lint_ignore = "E501,E0100"
let g:pymode_python = "python"
let g:pymode_options_colorcolumn = 0
let g:pymode_folding = 0

" Keep undo after buffer switch
set hidden

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set number
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
syntax enable
set background=dark
colorscheme monokai
set linebreak
set mouse=a
let g:gitgutter_max_signs=9999

" Use H and L to switch buffers
map H :bp<Return>
map L :bn<Return>

" Use J and K for old H and L behavior

set laststatus=2
set statusline=%f

let mapleader = ","

nmap =j :%!python -m json.tool<CR>
vnoremap <C-n> :norm<Space>

" Mappings for Nate's write.vim
noremap <leader>w :Write

set runtimepath+=$HOME/.vim/write.vim


" SETTINGS FROM STEVE LOSH'S TUTORIAL:
" ( http://stevelosh.com/blog/2010/09/coming-home-to-vim/ )

" set nocompatible gets rid of all the crap that Vim does to be vi
" compatible. It’s 2010 — we don’t need to be compatible with vi at the
" expense of functionality any more.
set nocompatible


" The modelines bit prevents some security exploits having to do with
" modelines in files. I never use modelines so I don’t miss any 
" functionality here.
set modelines=0


" Next I set my tab settings:
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


" Next are a few options that just make things better:
set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
" set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

"set undofile
" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a
" file. These files contain undo information so you can undo previous
" actions even after you close and reopen a file.



" The next thing I do is tame searching/moving:
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
" The first two lines fix Vim’s horribly broken default regex “handling”
" by automatically inserting a \v before any string you search for. This
" turns off Vim’s crazy default regex characters and makes searches use
" normal regexes. I already know Perl/Python compatible regex formatting,
" why would I want to learn another scheme?

" ignorecase and smartcase together make Vim deal with case-sensitive
" search intelligently. If you search for an all-lowercase string your
" search will be case-insensitive, but if one or more characters is
" uppercase the search will be case-sensitive. Most of the time this does
" what you want.

" gdefault applies substitutions globally on lines. For example, instead
" of :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what
" you want (when was the last time you wanted to only replace the first
" occurrence of a word on a line?) and if you need the previous behavior
" you just tack on the g again.

" incsearch, showmatch and hlsearch work together to highlight search
" results (as you type). It’s really quite handy, as long as you have the
" next line as well.

" The <leader><space> mapping makes it easy to clear out a search by
" typing ,<space>. This gets rid of the distracting highlighting once
" I’ve found what I’m looking for.

" The last two lines make the tab key match bracket pairs. I use this to
" move around all the time and <tab> is a hell of a lot easier to type
" than %.


" The next section makes Vim handle long lines correctly:
set wrap
set textwidth=0
set wrapmargin=0
set formatoptions=qrn1
" set colorcolumn=85
highlight ColorColumn ctermbg=Black
" These lines manage my line wrapping settings and also show a colored
" column at 85 characters (so I can see when I write a too-long line of
" code).

" See :help fo-table and the Vimcasts on soft wrapping and hard wrapping
" for more information.


" New Vim users will want the following lines to teach them to do
" things right:
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
" This will disable the arrow keys while you’re in normal mode to help you
" learn to use hjkl. Trust me, you want to learn to use hjkl. Playing a
" lot of Nethack also helps.

" It also disables the arrow keys in insert mode to force you to get back
" into normal mode the instant you’re done inserting text, which is the
" “right way” to do things.

" It also makes j and k work the way you expect instead of working in some
" archaic “movement by file line instead of screen line” fashion.


" Next, get rid of that stupid goddamned help key that you will invaribly
" hit constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


" I also like to make ; do the same thing as : — it’s one less key to hit
" every time I want to save a file:
nnoremap ; :
" I don’t remap : back to ; because it seems to break a bunch of plugins.


" Finally, I really like TextMate’s “save on losing focus” feature. I
" can’t remember a time when I didn’t want to save a file after tabbing
" away from my editor (especially with version control and Vim’s
" persistent undo):
au FocusLost * :wa

" END STEVE LOSH
