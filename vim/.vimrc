set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options

syntax on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set display=truncate
set encoding=UTF-8
set expandtab
set foldenable
set foldlevel=8
set foldmethod=syntax
set guifont=Fira\ Code\ Regular\ Nerd\ Font\ Complete:h12
set hlsearch
set incsearch
set laststatus=2
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list
set noerrorbells
set noshowmode
set noswapfile
set number
set shiftwidth=2
set showtabline=2
set softtabstop=2
set tabstop=2
set title

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

if version >= 700
  set history=64
  set undolevels=128
  set undodir=~/.vim/undodir/
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Say no trailing spaces

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Go no spaces
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

autocmd FileType c,cpp,proto,go,python,cmake,sh,md
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" always show sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" onedark stuff

let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onedark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline stuff

let g:lightline = {
  \  'colorscheme': 'one',
  \  'active': {
  \    'right': [
  \      [ 'lineinfo' ],
  \      [ 'percent' ],
  \      [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]
  \    ]
  \  },
  \  'component': {
  \    'charvaluehex': '0x%B'
  \  },
  \  'component_function': {
  \    'readonly': 'LightlineReadonly',
  \    'filename': 'LightlineFilename',
  \    'mode': 'LightlineMode',
  \    'fileformat': 'LightlineFileformat',
  \    'filetype': 'LightlineFiletype',
  \  },
  \  }

function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

