call plug#begin()
Plug 'vimsence/vimsence'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'arcticicestudio/nord-vim'
call plug#end()

set autochdir

" Nord colorscheme
" colorscheme nord

" run python
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:term python %<CR>
" run c++ (w/ input)
map <F6> :w<CR> :!g++ %<cr> :term ./a.out<CR>
" run c++ (w/o input)
map <F7> :w<CR> :!g++ %<cr> :!./a.out<CR>

" Vimsence options
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Workspace: {}'

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
