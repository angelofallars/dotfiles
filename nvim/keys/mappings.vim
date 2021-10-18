" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Copy to system clipboard
noremap <leader>c "*yy<cr>

" Paste without indent
noremap<leader>v "+p<cr>

" Pane navigation
noremap <C-j> <C-W><C-J>
noremap <C-k> <C-W><C-K>
noremap <C-l> <C-W><C-L>
noremap <C-h> <C-W><C-H>

" For vim-terminal
tnoremap <C-j> <C-\><C-n><C-W><C-J>
tnoremap <C-k> <C-\><C-n><C-W><C-K>
tnoremap <C-l> <C-\><C-n><C-W><C-L>
tnoremap <C-h> <C-\><C-n><C-W><C-H>

" Make terminal below
nnoremap <C-t> :split term://zsh<cr><C-w><S-j>:resize 5<cr>:set nonumber<cr>:set norelativenumber<cr>iclear<cr>
" Toggle NERDTree (Control-N = List files)
nnoremap <C-n> :NERDTreeToggle<cr>

" FZF (Fuzzy Finder)
nnoremap <C-p> :FZF<cr>

" Yank to end of line
nnoremap Y yg_

" Remove highlighting
map <C-c> :noh<cr>
