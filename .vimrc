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

noremap % v%

" Automates the above

:set showmatch

:set matchtime=3

inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

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
nnoremap j gj
nnoremap k gk

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

" --- OLD PATHOGEN STUFF --- "

" For pathogen.vim -> helps install plugins
" #execute pathogen#infect()

" Runs helptags for all installed plugins
" call pathogen#helptags()

" --- VIM PLUG STUFF --- "
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " Nerd tree

Plug 'vim-airline/vim-airline' " Airline

Plug 'gcmt/taboo.vim' " Taboo

Plug 'sgur/vim-lazygutter' " Lazygutter

"" Language client 
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

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

" --- Buffer Line --- "

" enable/disable bufferline integration >
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '>'

" --- fzf stuff --- "
"nmap <leader>f :GitFiles<CR>
"nmap <leader>b :Buffers<CR>
"
"imap <tab> <C-x><C-k>
"" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"
"" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)


" This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }
"
"" Default fzf layout
"" - down / up / left / right
"let g:fzf_layout = { 'down': '~40%' }
"
"" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10split enew' }
"
"" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }
"
"" Enable per-command history.
"" CTRL-N and CTRL-P will be automatically bound to next-history and
"" previous-history instead of down and up. If you don't like the change,
"" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
"let g:fzf_history_dir = '~/.local/share/fzf-history'
"
"" [Buffers] Jump to the existing window if possible
"let g:fzf_buffers_jump = 1
"
"" [[B]Commits] Customize the options used by 'git log':
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
"" [Tags] Command to generate tags file
"let g:fzf_tags_command = 'ctags -R'
"
"" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"
"" FZF {{{
"" <C-p> or <C-t> to search files
"nnoremap <silent> <C-t> :FZF -m<cr>
"nnoremap <silent> <C-p> :FZF -m<cr>
"
"" <M-p> for open buffers
"nnoremap <silent> <M-p> :Buffers<cr>
"
"" <M-S-p> for MRU
"nnoremap <silent> <M-S-p> :History<cr>
"
"" Use fuzzy completion relative filepaths across directory
"imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
"
"" Better command history with q:
"command! CmdHist call fzf#vim#command_history({'right': '40'})
"nnoremap q: :CmdHist<CR>
"
"" Better search history
"command! QHist call fzf#vim#search_history({'right': '40'})
"nnoremap q/ :QHist<CR>
"
"command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
"" }}}

" CtrlP fallbac"
" " For Ctrl-p
"set runtimepath^=~/.vim/bundle/ctrlp.vim

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " Windows


" For NERDTree
autocmd vimenter * NERDTree

autocmd BufWinEnter * NERDTreeMirror " Opens nerdtree in new tabs

autocmd VimEnter * NERDTree | wincmd p " Moves cursor to main buffer at start

" For YCM
"let g:ycm_register_as_syntastic_checker = 1 "default 1
"let g:ycm_show_diagnostics_ui = 1 "default 1
"
""will put icons in Vim's gutter on lines that have a diagnostic set.
""Turning this off will also turn off the YcmErrorLine and YcmWarningLine
""highlighting
"let g:ycm_enable_diagnostic_signs = 1
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_always_populate_location_list = 1 "default 0
"let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
"
"
"let g:ycm_complete_in_strings = 1 "default 1
"let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
"let g:ycm_path_to_python_interpreter = '' "default ''
"
"
"let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
"let g:ycm_server_log_level = 'info' "default info
"
"let g:ycm_global_ycm_extra_conf = "/.vim/.ycm_extra_conf.py"
"let g:ycm_confirm_extra_conf = 1
"
"
"let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
"let g:ycm_filetype_whitelist = { '*': 1 }
"let g:ycm_key_invoke_completion = '<C-Space>'
"
"
"nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
"
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"" For Tagbar
"nmap <F8> :TagbarToggle<CR>
"
"" For Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" 
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0k


" For PythonMode
" Disables syntax checking for python mode as Syntastic already does this
"let g:pymode_lint = 0
"let g:pymode_rope = 0
"
"" Binds python running
"let g:pymode_run_bind = '<leader>r'
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'
"let g:pymode_breakpoint_cmd = ''
"
"" Use deoplete.
"let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup=1

let g:deoplete#enable_refresh_always=0

let g:deoplete#file#enable_buffer_path=1

let g:deoplete#auto_completion_start_length = 0

"" Use neotex.
"let g:neotex_enabled = 1
"
"" Cmder tests
"if has("gui_running")
"  set term=xterm
"  set mouse=a
"  set nocompatible
"endif


" Language Client stuffs

" Required for operations modifying multiple buffers like rename.
"set hidden

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"    \ 'javascript': ['javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['pyls'],
"    \ }

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
