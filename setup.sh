# download and install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# copy vimrc
cat ./vimrc > ~/.vimrc

# install plugins
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git ./ctrlp.vim
git clone https://github.com/kchmck/vim-coffee-script.git ./vim-coffee-script
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/chriskempson/base16-vim.git
git clone https://github.com/bling/vim-airline ./vim-airline
