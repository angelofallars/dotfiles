" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Search for <files> in the git repository
nnoremap <C-p> :GFiles<cr>

" Get list of buffers with FZF
nnoremap <leader>f :Buffers<cr>

" Close buffer
nnoremap <C-q> :bd<cr>

" Remap for ctrl+6 (swap buffer)
nnoremap <C-l> <C-^>

" System clipboard Mappings
nnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y

nnoremap <F10> :Crun<cr>i
nnoremap <F11> :Ctest<cr>i
nnoremap <F12> :RustTest<cr>i
