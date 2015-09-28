# download and install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# setup javascript code folding
mkdir ~/.vim/ftplugin/
cp ./javascript.vim ~/.vim/ftplugin/javascript.vim

# get terminal colors
git clone git@github.com:tdheff/base16-melon ~/dev/base16-melon

# copy vimrc
cp ./vimrc ~/.vimrc

# copy fish config
cp ./config.fish ~/.config/fish/config.fish
