" Install and configure plugins


" Put plugins and dictionaries into this directory
" (use '~/.config/nvim/' to keep configuration separate from other vims)
let vimDir = expand('$HOME/.config/nvim')
" nvim-specific autoload directory:
let vimPlugFile = vimDir . '/autoload/plug.vim'
let vimPluginsDir = vimDir . '/plugged'


" Install vim-plug if not found
if empty(glob(vimPlugFile))
  let vimPlugUrl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  exec 'silent !curl -fLo ' . vimPlugFile . ' --create-dirs' . vimPlugUrl
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Install all the plugins
call plug#begin('~/.config/nvim/plugs')

  " Sensible defaults
  Plug 'tpope/vim-sensible'
  
  " File browser with git indicators
  Plug 'preservim/nerdtree'
  Plug 'vim-scripts/The-NERD-tree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  

  Plug 'jistr/vim-nerdtree-tabs'

  " git indicator in editor
  Plug 'airblade/vim-gitgutter'
  
  " Status bar
  Plug 'itchyny/lightline.vim'
  
  " Tabs
  Plug 'ap/vim-buftabline'
  
  " Telescope file finder / picker
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  
  " neovim language things
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  
  " Nicer LSP UI
  Plug 'glepnir/lspsaga.nvim'

call plug#end()

