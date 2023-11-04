export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Load zsh configs
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
unset conf

# starship
eval "$(starship init zsh)"
