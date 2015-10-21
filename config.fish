set -g WAHOO_PATH $HOME/.wahoo
set -g WAHOO_CUSTOM $HOME/.dotfiles
source $WAHOO_PATH/init.fish
bash ~/.shell_colors.sh

# autojump
. /usr/share/autojump/autojump.fish

# handy stuff
alias m43 "cd ~/dev/mark43"
alias initm43 "bash ~/mark43devinit.sh"

abbr -a ga git add
abbr -a gs git status
abbr -a gc git commit
abbr -a gp git push
abbr -a gco git checkout

# make node work
bass source ~/.nvm/nvm.sh ';' nvm use stable

. ~/.gitprompt/gitprompt.fish

# add some stuff to path
set PATH ~/src/apache-maven-3.3.3/bin/ $PATH
set PATH ~/bin $PATH
set PATH /usr/local/go/bin $PATH
