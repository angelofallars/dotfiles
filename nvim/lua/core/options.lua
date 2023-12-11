vim.cmd([[
autocmd FileType c            setlocal shiftwidth=8 tabstop=8
autocmd FileType scheme       setlocal shiftwidth=2 tabstop=2

autocmd FileType lua          setlocal shiftwidth=2 tabstop=2
autocmd FileType go           setlocal noexpandtab
autocmd FileType python       setlocal textwidth=80

autocmd FileType html         setlocal shiftwidth=2 tabstop=2 textwidth=120
autocmd FileType css          setlocal shiftwidth=2 tabstop=2
autocmd FileType sass         setlocal shiftwidth=2 tabstop=2
autocmd FileType scss         setlocal shiftwidth=2 tabstop=2
autocmd FileType less         setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript   setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript   setlocal shiftwidth=2 tabstop=2
autocmd FileType json         setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown     setlocal shiftwidth=2 tabstop=2 textwidth=100
autocmd FileType jsx          setlocal shiftwidth=2 tabstop=2
autocmd FileType tsx          setlocal shiftwidth=2 tabstop=2
autocmd FileType vue          setlocal shiftwidth=2 tabstop=2
autocmd FileType angular      setlocal shiftwidth=2 tabstop=2

autocmd FileType git          setlocal nonumber norelativenumber
autocmd FileType gitcommit    setlocal nonumber norelativenumber

autocmd FileType markdown     setlocal foldcolumn=2
autocmd FileType markdown     setlocal signcolumn=yes:2

autocmd BufNewFile,BufRead *.njk          setlocal filetype=html
autocmd BufNewFile,BufRead *waybar/config setlocal syntax=json5
autocmd BufNewFile,BufRead *.rasi         setlocal syntax=css
autocmd BufNewFile,BufRead *dunstrc       setlocal filetype=ini

autocmd BufEnter *                        silent! lcd %:p:h
]])

vim.opt.autochdir = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true

vim.opt.wrap = true
vim.opt.textwidth = 0
vim.opt.colorcolumn = "0"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.undofile = true

-- Blinking cursor
vim.opt.guicursor = vim.opt.guicursor + "n-v-c-i:blinkon5"

vim.opt.updatetime = 250
vim.opt.completeopt = "menuone,noselect"
vim.opt.showmode = false
vim.opt.compatible = false

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.termguicolors = true

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars = vim.opt.fillchars + "horiz:━"
vim.opt.fillchars = vim.opt.fillchars + "horizup:━"
vim.opt.fillchars = vim.opt.fillchars + "horizdown:━"
vim.opt.fillchars = vim.opt.fillchars + "vert:▏"
vim.opt.fillchars = vim.opt.fillchars + "vertleft:▏"
vim.opt.fillchars = vim.opt.fillchars + "vertright:▏"
vim.opt.fillchars = vim.opt.fillchars + "verthoriz:▏"

vim.opt.list = true

vim.opt.listchars = {
	leadmultispace = "| ",
	tab = "| ",
}

vim.cmd([[filetype plugin on]])
vim.opt.filetype.plugin = true
