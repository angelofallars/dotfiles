" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Search for <files> in the git repository
nnoremap <leader>f :GFiles<cr>

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
" map <C-c> :noh<cr>

" Remap ctrl+a to ctrl+s because tmux already got ctrl+a
nnoremap <C-s> <C-a>

" System clipboard Mappings
nnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>p "+p
nnoremap <leader>P "+P

nnoremap <leader>ct :RustTest<cr>i

nnoremap <F10> :Crun<cr>i
nnoremap <F11> :Ctest<cr>i
nnoremap <F12> :RustTest<cr>i
