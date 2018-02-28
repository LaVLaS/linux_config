" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


filetype off

call plug#begin('~/.local/share/nvim/plugged')
" Fancy status line
Plug 'bling/vim-airline'
" Fast quoting of text
Plug 'tpope/vim-surround'
" Show line changes in the gutter
Plug 'airblade/vim-gitgutter'
" Hotkeys for commonly used navigation commands: buffers, files, diff
Plug 'tpope/vim-unimpaired'
call plug#end()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" This will allow vim splits to be resized using the mouse inside tmux
if &term =~ '^screen'
	" tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set background=dark
colorscheme harlequin

"Default to case insensitive searching. Case sensitive search only when upper case is included in search term
set ignorecase
set smartcase

" Landon's Custom VIM settings
set directory=~/tmp/vimbackup//
set backupdir=~/tmp/vimbackup//

" automatically change window's cwd to file's dir
" set autochdir

"Always show the status bar
set laststatus=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Round indent to multiple of 'shiftwidth'
set shiftround
set expandtab

set number

" Disable the freaking bell
set belloff=all
"
" Flag trailing whitespace
match SpellBad '\s\+$'

" Remap pane movement
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Two-spaces for Yaml files
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2
autocmd FileType yaml set tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim airline settings
"let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
"Run lint on save
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

"Highlight the current line
set cursorline

" Default to opening splits on the bottom/right
set splitbelow
set splitright
