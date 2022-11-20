" Inspiration taken from the following:
"
" https://console.dev/articles/neovim-best-code-editor-ide-for-developers/
"
" https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887


" Separate nvim's info file from vim's info file
set viminfo='25,\"50,n~/..nvim/.viminfo

" Install and configure plugins
source $HOME/.config/nvim/plugins.vim

" Configure plugin-independent appearance
source $HOME/.config/nvim/appearance.vim

" Configure plugin-independent keybinds
source $HOME/.config/nvim/keybinds.vim

" Configure plugin-independent behavior
source $HOME/.config/nvim/behavior.vim

" Configure plugin-independent language server settings
source $HOME/.config/nvim/lsp.vim

