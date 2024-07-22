# Oh My ZSH Setup
export ZSH="$ZDOTDIR/ohmyzsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
alias zshrc="vim ${ZDOTDIR}/.zshrc"
alias sshconfig="vim ~/.ssh/config"
alias update="sudo apt update && sudo apt upgrade -y && sudo snap refresh && " \
    "sudo flatpak update"
alias which-wm="echo $XDG_SESSION_TYPE"

# Load un-version-controlled ZSH config
if [ -f $ZDOTDIR/zshrc.nosync ]; then
    source $ZDOTDIR/zshrc.nosync
fi

