let g:ale_disable_lsp = 1

call plug#begin()
Plug 'vimsence/vimsence'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
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
colorscheme onedark

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.colnr = ' C:'
let g:airline_section_y = ''
let g:airline#extensions#ale#enabled = 1

" Highlight current row
set cursorline

" Use mouse
set mouse=a

" Change window title to Neovim
let &titlestring = "Neovim"
set title

" NerdTree
let NERDTreeMinimalUI=1

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
