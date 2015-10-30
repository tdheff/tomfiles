# prompt to confirm vim stuff
read -p "This will overwrite your entire vim configuration. Continue [y/N]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Clearing vim config..."
  rm ~/.vimrc
  rm -rf ~/.vim

  echo "Installing vundle..."
  # download and install plug.vim 
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim configs..."
  # copy vimrc
  cp ./vimrc ~/.vimrc

  echo "Installing plugins..."
  # install plugins
  vim +PlugInstall +qall > /dev/null

  echo "Installing colorscheme..."
  # make color folder and copy scheme
  mkdir -p ~/.vim/colors
  cp ./base16-matz.vim ~/.vim/colors/
  cp ./base16-melonalternate.vim ~/.vim/colors/

  # instal
  echo "Done."
fi


# fish install with prompt
read -p "Install fish and wahoo? [y/N]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Installing wahoo and fish..."
  # install wahoo and fish
  sudo curl -L git.io/wa | sh

  echo "Copying config.fish..."
  # copy config.fish
  cp ./config.fish ~/.config/fish/config.fish

  echo "Installing cool prompt..."
  # install git prompt
  git clone git@github.com:tdheff/bash-git-prompt.git ~/.gitprompt

  echo "Configuring colorscheme..."
  # copy colorscheme
  cp ./shell_colors.sh ~/.shell_colors.sh
fi

# git config with prompt
read -p "Install git config? [y/N]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Installing git config..."
  # copy vimrc
  cp ./gitconfig ~/.gitconfig
fi

