" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Copy to system clipboard
noremap <leader>c "*yy<cr>

" Paste without indent
noremap<leader>v "+p<cr>

" Pane navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" For vim-terminal
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>

" Make terminal below
nnoremap <C-t> :split term://zsh<cr><C-w><S-j>:resize 5<cr>:set nonumber<cr>iclear<cr>
" Toggle NERDTree (Control-N = List files)
nnoremap <C-n> :NERDTreeToggle<cr>

" Escape from terminal and return to previous window
tnoremap <C-b> <C-\><C-n><C-w><c-p>
" Go to terminal below
nnoremap <C-b> <C-w>ji

" Quit terminal
tnoremap <C-q> <C-\><C-n>:q!<cr>

" Resize terminal
tnoremap <A-p> <C-\><C-n>:resize +1<cr>i
tnoremap <A-o> <C-\><C-n>:resize -1<cr>i

" Remove highlighting
map <C-c> :noh<cr>

" FZF
noremap <leader>p :Files<cr>
noremap <leader>g :GFiles<cr>
noremap <leader>b :Buffers<cr>

