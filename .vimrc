if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set backspace=2               " backspace in insert mode works like normal editor
syntax on                     " syntax highlighting
filetype indent on            " activates indenting for files
set autoindent                " auto indenting
set number                    " line numbers
set nobackup                  " get rid of anoying ~file
let mapleader = "\<Space>"    " leader as space
set laststatus=2

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

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
" ctrlp 
source /home/tommy/.vimd/ctrlp.vim

"""""""""""""""""
" lang specific "
"""""""""""""""""

" javascript
source /home/tommy/.vimd/langs/javascript.vim

""""""""""""""""
" reload vimrc "
""""""""""""""""

augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
