" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Search for <files> in the git repository
"nnoremap <leader>f :GFiles<cr> -- Currently broken
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>g :call fzf#run({'source': 'dirget -a', 'sink': 'e', 'window': {'width': 0.85, 'height': 0.90}})<cr>

" Get list of buffers with FZF
nnoremap <leader>d :Buffers<cr>

" Next/previous buffer
nnoremap <C-j> :bn<cr>
nnoremap <C-k> :bp<cr>

" Close buffer
nnoremap <C-q> :bd<cr>

" Remap for ctrl+6 (swap buffer)
nnoremap <C-l> <C-^>

" Yank to end of line
nnoremap Y yg_

" Remove highlighting
map <C-c> :noh<cr>:<esc>

" Remap ctrl+a to ctrl+s because tmux already got ctrl+a
nnoremap <C-s> <C-a>

" System clipboard Mappings
nnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>p "+p
nnoremap <leader>P "+P
