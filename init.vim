let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif


" List plugins to be installed

call plug#begin('~/.config/nvim/plugged')

"" Install LanguageClient-neovim, for Language Server Protocol support
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh' }

"" Install deoplete, for showing suggested completions while typing
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" Install gruvbox, a nice theme
Plug 'https://github.com/morhetz/gruvbox'

"" Install vim-hardtime, to stop your habit of spamming keys
"" the cursor
Plug 'https://github.com/takac/vim-hardtime'

call plug#end()


" Setup vim-hardtime, a plugin to stop your habit of spamming a key to move
" the cursor.

let g:list_of_normal_keys = ["x", "h", "j", "k", "l", "-", "+", "{", "}"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = ["<ESC>", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

let g:hardtime_timeout = 1200
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 2

let g:hardtime_default_on = 0



" Setup line-numbering

"" Show the current line number
set number

"" Show the other linenumbers relative to the current line number
set relativenumber



" Show whitespace visually
set list
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=extends:>
set listchars+=trail:~
"set listchars+=tab:>·
"set listchars+=eol:¬
"set listchars+=space:␣


" Setup the gruvbox colorscheme

"" Set the contrast (soft/medium/hard)
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'medium'

"" Use the dark background (dark/light)
set background=dark

"" Actually set the colorscheme
syntax on
colorscheme gruvbox



" Enable deoplete (for showing suggested completions while typing) at startup
let g:deoplete#enable_at_startup = 1



" Setup the language client

"" With set hidden, opening a new file when the current buffer has unsaved
"" changes causes files to be hidden instead of closed. Required for operations
"" modifying multiple buffers like rename.
set hidden

"" Set the paths of the language clients for specific languages
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'stable', 'rls'],
	\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
	\ 'python': ['pyls'],
	\ 'cpp': ['clangd'],
	\ 'c': ['clangd'],
	\ }



" Setup custom keybinds


"" Setup normal mode keybinds

""" '<F5>' to open a general language client menu
nmap <F5> <Plug>(lcn-menu)

""" 'K' to show information about the symbol under the cursor
nmap <silent>K <Plug>(lcn-hover)

""" 'gd' to jump to definition of the symbol under the cursor
nmap <silent> gd <Plug>(lcn-definition)

""" '<F2>' to rename the symbol under the cursor
nmap <silent> <F2> <Plug>(lcn-rename)

