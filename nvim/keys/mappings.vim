" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Pane navigation
noremap <C-j> <C-W><C-J>
noremap <C-k> <C-W><C-K>
noremap <C-l> <C-W><C-L>
noremap <C-h> <C-W><C-H>

" Search for <files> in the git repository
"nnoremap <leader>f :GFiles<cr> -- Currently broken
nnoremap <leader>f :call fzf#run({'source': 'dirget', 'sink': 'e', 'window': {'width': 0.65, 'height': 0.85}})<cr>

" Yank to end of line
nnoremap Y yg_

" Remove highlighting
map <C-c> :noh<cr>

" Remap ctrl+a to ctrl+s because tmux already got ctrl+a
nnoremap <C-s> <C-a>
