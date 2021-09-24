" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
" nnoremap <C-Q> :wq!<CR>:q<CR>

" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Copy to system clipboard
noremap <leader>c "*yy<cr>

" Paste without indent
noremap<leader>v "+p<cr>

" Pane navigation
noremap <A-j> <C-W><C-J>
noremap <A-k> <C-W><C-K>
noremap <A-l> <C-W><C-L>
noremap <A-h> <C-W><C-H>

" For vim-terminal
tnoremap <A-j> <C-\><C-n><C-W><C-J>
tnoremap <A-k> <C-\><C-n><C-W><C-K>
tnoremap <A-l> <C-\><C-n><C-W><C-L>
tnoremap <A-h> <C-\><C-n><C-W><C-H>

" Make terminal below
nnoremap <C-t> :split term://zsh<cr><C-w><S-j>:resize 5<cr>:set nonumber<cr>:set norelativenumber<cr>iclear<cr>
" Toggle NERDTree (Control-N = List files)
nnoremap <C-n> :NERDTreeToggle<cr>

" Escape from terminal and return to previous window
" tnoremap <C-b> <C-\><C-n><C-w><c-p>
" Go to terminal below
" nnoremap <C-b> <C-w>ji

" Quit terminal
" tnoremap <C-q> <C-\><C-n>:q!<cr>

" Resize terminal
tnoremap <A-p> <C-\><C-n>:resize +1<cr>i
tnoremap <A-o> <C-\><C-n>:resize -1<cr>i

" Remove highlighting
map <C-c> :noh<cr>
