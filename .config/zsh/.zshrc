# Oh My ZSH Setup
export ZSH="$ZDOTDIR/ohmyzsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Homebrew
if command -v brew &> /dev/null ; then
    # Displays all user-installed taps, formulae, and casks
    alias brew-history="brew bundle dump --file -"
fi

# Launch Services Manager
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Undocumented macOS utility. Can be used to reset Launchpad layout
    alias lsregister="/System/Library/Frameworks/CoreServices.framework/ \
        Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/ \
        lsregister"
fi

# Prints name of current window manager
alias which-wm="echo $XDG_SESSION_TYPE"

# Configuration Editors
alias rc-zsh="${EDITOR} ${ZDOTDIR}/.zshrc"
alias rc-ssh="${EDITOR} ~/.ssh/config"

# Package Updater
update_str="("

if command -v brew &> /dev/null ; then
    update_str="${update_str} brew update && brew upgrade;"
fi

if command -v apt &> /dev/null ; then
    if [[ "$OSTYPE" != "darwin"* ]]; then
        update_str="${update_str} sudo apt update && sudo apt upgrade;"
    fi
fi

if command -v snap &> /dev/null ; then
    update_str="${update_str} sudo snap refresh;"
fi

if command -v flatpak &> /dev/null ; then
    update_str="${update_str} sudo flatpak update;"
fi

alias update="${update_str})"

# Load local ZSHRC
if [ -f $ZDOTDIR/zshrc.nosync ]; then
    source $ZDOTDIR/zshrc.nosync
fi

