export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/zsh_functions/fzf-open-file.zsh
