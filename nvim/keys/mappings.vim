" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

" Visual copy to keyboard
noremap <C-y> "+y"

" Make terminal below
nnoremap <C-t> :split term://bash<cr><C-w><S-j>:resize 5<cr>:set nonumber<cr>iclear<cr>
" Toggle NERDTree (Control-L = List files)
nnoremap <C-l> :NERDTreeToggle<cr>

" Quit from terminal and return to previous window
tnoremap <C-b> <C-\><C-n><C-w><c-p>
" Go to terminal below
nnoremap <C-b> <C-w>ji

" Quit terminal
tnoremap <C-q> <C-\><C-n>:q!<cr>

" Resize terminal
tnoremap <A-p> <C-\><C-n>:resize +1<cr>i
tnoremap <A-o> <C-\><C-n>:resize -1<cr>i

" Initiate FZF - ( Ctrl+/ = 'Super' find )
nnoremap <C-_> :FZF<cr>
