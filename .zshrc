# Enable command correction
setopt CORRECT

# History settings (nicer than default)
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Autocompletion
autoload -Uz compinit
compinit

# Prompt (simple but useful)
PROMPT='[@%m %1~]› '

# Syntax highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ls='ls --color=auto'
alias fetch='fastfetch'
alias p='paru -S'
alias ms='mousepad'
alias comp='g++ -std=c++17 -Wall -Wextra -o main'
alias run='./main'oc
alias wifi='nmtui'
alias mci='sudo make clean install'
alias clock='tty-clock -c -s'
#alias ls='ls -a'
alias syu='sudo pacman -Syu'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"
# Created by `pipx` on 2025-10-30 14:32:32
export PATH="$PATH:/home/june/.local/bin"
