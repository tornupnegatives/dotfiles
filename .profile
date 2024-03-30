# --------------------------------------
# XDG Base Directory Specification Paths
# --------------------------------------
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# -----------
# Environment
# -----------
export LANG=en_US.UTF-8
export EDITOR='vim'

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# ---
# ZSH
# ---
export ZDOTDIR="$HOME"/.config/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# Dump ZSH completions in state dir
if [ ! -d "$XDG_STATE_HOME/zsh" ]; then
    mkdir -p "$XDG_STATE_HOME/zsh"
fi

# Dump ZSH history in state dir
if [ ! -f "$ZSH_STATE_DIR/history" ]; then
    touch "$XDG_STATE_HOME/zsh/history"
fi

# ------
# Python
# ------
export PYTHONSTARTUP=${XDG_CONFIG_HOME}/python/pythonrc

# Add macOS Python site dir to PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="$PATH:${HOME}/Library/Python/3.9/bin"
fi

# --------
# Homebrew
# --------
BREW_PATH=""
if [ -d /usr/local/Homebrew ]; then
    eval "$(/usr/local/Homebrew/bin/brew shellenv)"
elif [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d /home/linuxbrew/.linuxbrew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -d ${HOME}/homebrew ]; then
    eval "$(${HOME}/homebrew/bin/brew shellenv)"
fi

# ------------
# Java (macOS)
# ------------
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ -d /usr/local/opt/openjdk/bin ]; then
        export PATH="/usr/local/opt/openjdk/bin:$PATH"
    fi
fi

# -----
# Other
# -----
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export KERAS_HOME=${XDG_STATE_HOME}/keras
export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker
export LESSHISTFILE=${XDG_CACHE_HOME}/less/history
export DVDCSS_CACHE=${XDG_DATA_HOME}/dvdcss
export GNUPGHOME=${XDG_DATA_HOME}/gnupg
export CUDA_CACHE_PATH=${XDG_CACHE_HOME}/nv

# -------
# Aliases
# -------
alias sshconfig="${EDITOR} ${HOME}/.ssh/config"
alias zshrc="${EDITOR} ${ZDOTDIR}/.zshrc"


