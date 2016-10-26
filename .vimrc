if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

let mapleader = "\<Space>"    " leader as space
let maplocalleader = ","      " leader as space 
set backspace=2               " backspace in insert mode works like normal editor
syntax on                     " syntax highlighting
filetype indent on            " activates indenting for files
set autoindent                " auto indenting
set number                    " line numbers
set nobackup                  " get rid of anoying ~file
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile

call plug#begin('~/.vim/plugged')

" basics
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/syntastic'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" elm
Plug 'ElmCast/elm-vim'

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

call plug#end()

set background=dark
colorscheme gruvbox

"""""""""""""""""
" plugin config "
"""""""""""""""""

" easymotion
source /home/tommy/.vimd/easymotion.vim
" airline
source /home/tommy/.vimd/airline.vim
" fzf 
source /home/tommy/.vimd/fzf.vim
" syntastic 
source /home/tommy/.vimd/syntastic.vim

"""""""""""""""""
" lang specific "
"""""""""""""""""

" javascript
source /home/tommy/.vimd/langs/javascript.vim
" elm
source /home/tommy/.vimd/langs/elm.vim

""""""""""""""""""""
" some nice things "
""""""""""""""""""""

" buffer navigation
nmap <c-j> :bnext<Enter>
nmap <c-k> :bprevious<Enter>

""""""""""""""""
" reload vimrc "
""""""""""""""""

augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
