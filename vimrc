" Set Shell
set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'jlanzarotta/bufexplorer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set backspace=2
syntax on
set autoindent
set nowrap
set nobackup
set background=dark
set laststatus=2
set expandtab
set shiftwidth=2
set softtabstop=2
set guifont=Envy\ Code\ R:h16
let g:airline_powerline_fonts=1
set number
set showbreak=↪
set t_Co=256
let base16colorspace=256
colorscheme base16-melon

" Map space to leader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Easymotion settings
map <Leader> <Plug>(easymotion-prefix)
" replace normal search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" correct n mappings
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" bidirectional find with s
nmap s <Plug>(easymotion-s)
" better hjkl
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" keep place in line
let g:EasyMotion_startofline = 0

" airline setings
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_whitespace=0

" vim-javascript settings
" let g:javascript_conceal=1

" Map for escape possibly?

" CtrlP alt for buffer switch
nnoremap <leader><C-p> :CtrlPBuffer<CR>

" Disable ex mode
nnoremap Q <nop>

" Autoreload this file
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
