#!/bin/bash

function log() {
	echo "[[ $1 ]]"
}

function chrome_() {
	if hash google-chrome 2>/dev/null; then
    log "Chrome already installed.";
  else
    log "Installing chrome...";
		sudo apt-get install -y libxss1 libappindicator1 libindicator7;
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
		sudo dpkg -i google-chrome*.deb;
		rm google-chrome-stable_current_amd64.deb;
		log "Installed chrome...";
  fi
}

function git_() {
	if hash git 2>/dev/null; then
    log "Git already installed.";
  else
    log "Installing git...";
		sudo apt-get install -y git
		cp gitconfig ~/.gitconfig
		log "Installed git...";
  fi
}

function neovim_() {
	if hash nvim 2>/dev/null; then
    log "Neovim already installed.";
  else
    log "Installing neovim...";
    wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
		mv nvim.appimage nvim
		chmod u+x nvim
		sudo mv nvim /usr/local/bin/
		log "Installed neovim...";
  fi
}

function fish_() {
	if which fish 1>/dev/null; then
    log "Fish already installed.";
  else
    log "Installing fish...";
		sudo apt-get install -y fish
		chsh -s `which fish`
		cp ./config.fish ~/.config/fish/config.fish
		fish -c "fisher add fishpkg/fish-prompt-mono"
		log "Installed fish...";
  fi
}

function mononoki_() {
	if [ -d /usr/local/share/fonts/truetype/mononoki/ ]; then
    log "Mononoki already installed.";
  else
    log "Installing mononoki...";
		wget https://github.com/madmalik/mononoki/releases/download/1.2/mononoki.zip
		unzip mononoki.zip -d mononoki
		sudo mkdir -p /usr/local/share/fonts/truetype/mononoki
		sudo cp ./mononoki/*.ttf /usr/local/share/fonts/truetype/mononoki/
		rm -r mononoki*
		rm mononoki*
		log "Installed mononoki...";
  fi
}

function asdf_() {
	if which asdf 1>/dev/null; then
    log "asdf already installed.";
  else
    log "Installing asdf...";
		git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5
		mkdir -p ~/.config/fish/completions
		cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
		source $HOME/.asdf/asdf.sh
		log "Installed asdf...";
  fi
}

function hub_() {
	if which hub 1>/dev/null; then
    log "hub already installed.";
  else
    log "Installing hub...";
		asdf plugin-add hub
		VERSION=`asdf list-all hub | tail -1`
		asdf install hub $VERSION
		asdf global hub $VERSION
		log "Installed asdf...";
  fi
}

function erlang_() {
	if which erl 1>/dev/null; then
    log "Erlang already installed.";
  else
    log "Installing erlang...";
		asdf plugin-add erlang
		VERSION=`asdf list-all erlang | tail -1`
		sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop
		asdf install erlang $VERSION
		asdf global erlang $VERSION
		log "Installed erlang...";
  fi
}

function elixir_() {
	if which mix 1>/dev/null; then
    log "Elixir already installed.";
  else
    log "Installing elixir...";
		asdf plugin-add elixir
		VERSION=`asdf list-all elixir | tail -1`
		asdf install elixir $VERSION
		asdf global elixir $VERSION
		log "Installed elixir...";
  fi
}

function vscode_() {
	if which code 1>/dev/null; then
    log "VSCode already installed.";
  else
    log "Installing VSCode...";
		sudo snap install code --classic
		log "Installed VSCode...";
  fi
}

function fzf_() {
	if which fzf 1>/dev/null; then
    log "fzf already installed.";
  else
    log "Installing fzf...";
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		yes | ~/.fzf/install
		log "Installed fzf...";
  fi
}

chrome_
git_
neovim_
fish_
mononoki_
asdf_
hub_
erlang_
elixir_
vscode_
fzf_
