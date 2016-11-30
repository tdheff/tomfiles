set -e

# prompt to confirm vim stuff
read -p "This will overwrite your entire vim configuration. Continue [y/N]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Clearing vim config..."
  rm ~/.vimrc
  rm -rf ~/.vim

  echo "Installing vundle..."
  # download and install plug.vim 
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim configs..."
  # copy vimrc
  cp ./.vimrc ~/.vimrc
  cp -r ./.vimd ~/

  echo "Installing plugins..."
  # install plugins
  vim +PlugInstall +qall > /dev/null

  # instal
  echo "Done."
fi


# fish install with prompt
read -p "Install fish and fisherman? [y/N]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Installing fish..."
  # install wahoo and fish
  sudo apt-add-repository ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get install fish

  echo "Installing fisherman..."
  # install fisherman
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

  echo "Copying config.fish..."
  # copy config.fish
  cp ./config.fish ~/.config/fish/config.fish
fi

# git config with prompt
read -p "Install git config? [y/N]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Installing git config..."
  # copy vimrc
  cp ./.gitconfig ~/.gitconfig
fi

