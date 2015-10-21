" Set Shell
set shell=/bin/bash

let $TERM = "xterm-256color"
set t_Co=256

set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""""""
" plug.vim
call plug#begin('~/.vim/plugged')

" basics
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
Plug 'osyo-manga/vim-over'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" lang specific
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'dag/vim-fish'

" aesthetic 
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'

" fuzzy search
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

"Plug 'jlanzarotta/bufexplorer'

call plug#end()
" end plug.vim
""""""""""""""""""""""""""""""

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
let g:airline_powerline_fonts=1
set number
set showbreak=↪
let g:airline_theme = "hybridline"
let base16colorspace=256
let g:solarized_termcolors=256
colorscheme base16-material
"colorscheme solarized 

" Font setter
"set guifont=Envy\ Code\ R\ 13

" Map space to leader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Easy buffer switching
nnoremap <C-j> :bn<Return>
nnoremap <C-k> :bp<Return>

" vim-over
nnoremap <Leader><C-s> :OverCommandLine<Return>%s/

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

" airline settings
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 1

" ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" syntastic settings
if executable('eslint')
  let g:syntastic_javascript_checkers = ['eslint']
end
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP alt for buffer switch
nnoremap <leader><C-p> :CtrlPBuffer<CR>
" ctrlp improvements
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_max_files=0

" Disable ex mode
nnoremap Q <nop>

" Autoreload this file
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
