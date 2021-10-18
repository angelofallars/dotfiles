" coc already has lsp so disable lsp of ale
let g:ale_disable_lsp = 1

call plug#begin()
" Discord Rich Presence (The most important plugin)
Plug 'vimsence/vimsence'
"Plug 'andweeb/presence.nvim'

" Popular LSP provider
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File manager
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Instant markdown results in browser
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" PEP8 linter
Plug 'dense-analysis/ale'

" Smooth scrolling
" Plug 'psliwka/vim-smoothie'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Fancy NERDFont symbols
Plug 'ryanoasis/vim-devicons'

" Automatic pairing of () [] and {}
Plug 'jiangmiao/auto-pairs'

" One Dark theme
Plug 'joshdick/onedark.vim'

" Pretty status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show added, modified and removed lines
Plug 'airblade/vim-gitgutter'

" HTML close tag
Plug 'alvan/vim-closetag'

" CSS coloring
Plug 'ap/vim-css-color'

" Show git branch and add :Git functionality
Plug 'tpope/vim-fugitive'

call plug#end()

" Vimsence (Discord Rich Presence) options
let g:vimsence_small_text = 'Neovim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Workspace: {}'

set autochdir

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set textwidth=80

set ai

" Blinking cursor
set guicursor+=n-v-c-i:blinkon5

" Highlight current row
" set cursorline

" Use mouse
" set mouse=a

" One Dark theme
let g:onedark_termcolors = 16
colorscheme onedark
let g:airline_theme='onedark'

" Airline setup
let g:airline#extensions#ale#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = ' '
let g:airline_symbols.colnr = ' C:'

" Disable display of text encoding
let g:airline_section_y = ''

set colorcolumn=80

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Diagonal powerline
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

" Change window title to Neovim
let &titlestring = "Neovim"
set title

let $FZF_DEFAULT_OPTS="--preview='source-highlight --failsafe --out-format=esc -o STDOUT -i {}' --layout reverse"

" NerdTree
let NERDTreeMinimalUI=1

" Rich presence text on large image
let g:presence_neovim_image_text   = "I use Neovim btw"

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
