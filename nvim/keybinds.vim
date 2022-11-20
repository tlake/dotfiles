" Configure plugin-independent keybinds


" Set the leader key
let mapleader = ","


" copy, cut and paste
vmap <C-y> "+y
vmap <C-x> "+c
vmap <C-p> c <ESC> "+p
imap <C-p> <ESC> "+pa


" word movement
imap <S-Left> <Esc> bi
nmap <S-Left> b
imap <S-Right> <Esc><Right> wi
nmap <S-Right> w


" indent/unindent with tab/shift-tab
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-tab> <<


" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>


" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>


" clear highlights
nnoremap <leader><space> :noh<cr>


" tag list
map <leader>g :TagbarToggle<CR>

