# prompt to confirm
read -p "This will overwrite your entire vim configuration. Continue [y/N]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Clearing vim config..."
  rm ~/.vimrc
  rm -rf ~/.vim

  echo "Installing vundle..."
  # download and install vundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  echo "Installing vim configs..."
  # copy vimrc
  cp ./vimrc ~/.vimrc
  # copy vim directory
  cp -r ./vim ~/.vim

  echo "Done. Start vim and then run :PluginInstall"
fi

