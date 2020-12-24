
" ===================================
" CHANGE THIS TO YOUR PYTHON PROVIDER !!!
" ===================================
let g:python3_host_prog='/home/maksym/miniconda3/envs/py37/bin/python'


"Windows subsystem annoying beep fix
set visualbell

"set t_Co=256

set autoindent

" show existing tab with 4 spaces width
set tabstop=8
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" Turn on line numbering. Turn it off with “set nonu”

set number
set relativenumber

" Case insensitive search

set ic

" Higlhight search

set hls

" Wrap text instead of being on one line

set lbr

" Change colorscheme from default to solarized
"let g:solarized_termcolors=16
set termguicolors
colorscheme NeoSolarized
set t_Co=256

"set t_8f=^[[38;2;%lu;%lu;%lum
"set t_8b=^[[48;2;%lu;%lu;%lum

" Backspace stuff

set backspace=indent,eol,start

" Language settings

setlocal spell spelllang=en_us

" Bracket matching selection

"noremap % v%

" Automates the above

":set showmatch
"
":set matchtime=3
"
"inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"
"inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"
"inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" Rebinds for escape key

ino jj <esc>

cno jj <c-c>

vno v <esc>

" Bunch of color hacks to make this work in WSL
hi Normal guibg=bg
hi Normal guifg=fg
hi NonText guibg=bg
hi NonText guifg=fg
hi SpellBad guibg=bg
hi SpellBad guifg=fg
hi SpellLocal guibg=bg
hi SpellLocal guifg=fg
hi SpellCap guibg=bg
hi SpellCap guifg=fg
hi SpellRare guibg=bg
hi SpellRare guifg=fg
hi EndOfBuffer guibg=bg
hi EndOfBuffer guifg=fg
hi Underline guibg=bg
hi Underline guifg=fg

"Background stuff

set background=dark

"Color mode stuff

" Folding stuff
set foldenable
set foldlevelstart=10 "Opens most folds by def
set foldnestmax=10 " sets max for fold

"move vertically by visual line
"nnoremap j gj
"nnoremap k gk

" Sudo permissions (unix-based os)
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Adds column at line 80
set colorcolumn=80 
" mouse support
set mouse=a

" Helps you actually get out of the terminal in nvim terminal emulator
tnoremap <Esc> <C-\><C-n>


" ------------------------- Plugin stuff ------------------------- " 

filetype off

" --- VIM PLUG STUFF --- "
call plug#begin('~/.vim/plugged')

" Tim Pope's plugins
"Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-unimpaired' " Unimpaired vim keybinds
Plug 'tpope/vim-speeddating' " Increment dates
Plug 'tpope/vim-surround' " Increment dates
Plug 'tpope/vim-repeat' " Repeat plugin commands with .

Plug 'vim-scripts/indentpython.vim' " Auto-indent pep8 style

Plug 'kshenoy/vim-signature' " Visual marks

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

"Plug 'scrooloose/nerdtree' " Nerd tree

Plug 'vim-airline/vim-airline' " Airline
"Plug 'vim-airline/vim-airline-themes' " Airline themes

Plug 'gcmt/taboo.vim' " Taboo


" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Jedi python autocompletion
Plug 'zchee/deoplete-jedi'

Plug 'donRaphaco/neotex' " neo tex latex auto preview

" Fuzzy file search fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Initialize plugin system
call plug#end()

" Set syntax on
syntax on
filetype plugin indent on

" -- Airline -- "
" --- Buffer Line --- "

" enable/disable bufferline integration >
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#fnamemod = ':t'

" Replace tabs with buffers. Solution by Josh Davis
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>


set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux


"" Use deoplete.
let g:deoplete#enable_at_startup=1

" Neovim debugging
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
