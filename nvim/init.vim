let g:ale_disable_lsp = 1

call plug#begin()
Plug 'vimsence/vimsence'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
call plug#end()

set autochdir

" run python
" autocmd FileType python nnoremap <buffer> <F5> :w<CR>:term python %<CR>
" run c++ (w/ input)
map <F6> :w<CR> :!g++ %<cr> :term ./a.out<CR>
" run c++ (w/o input)
map <F7> :w<CR> :!g++ %<cr> :!./a.out<CR>

" Vimsence options
let g:vimsence_small_text = 'Neovim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Workspace: {}'

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set ai

let g:onedark_termcolors = 16
let g:airline_theme='onedark'
colorscheme onedark

" Highlight current row
set cursorline

" Use mouse
set mouse=a

" Change window title to Neovim
let &titlestring = "Neovim"
set title

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
