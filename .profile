# --------------------------------------
# XDG Base Directory Specification Paths
# --------------------------------------
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_RUNTIME_DIR=/run/user/${UID}

# -----------
# Environment
# -----------
export LANG=en_US.UTF-8
export EDITOR='vim'

LOCAL_BIN_DIR=${HOME}/.local/bin
if [ -d ${LOCAL_BIN_DIR} ]; then
    export PATH=$PATH:${LOCAL_BIN_DIR}
fi

# ---
# ZSH
# ---
export ZSH=${XDG_DATA_HOME}/oh-my-zsh
export HISTFILE=${XDG_STATE_HOME}/zsh/history
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

# Specifying the ZSH state directory prevents the creation of .zcompdump files
# in the user's home directory
ZSH_STATE_DIR=${XDG_STATE_HOME}/zsh
if [ ! -d ${ZSH_STATE_DIR} ]; then
    mkdir -p ${ZSH_STATE_DIR}
fi

# Specifying the HISTFILE prevents the creation of .zsh_history files in the
# users's home directory
if [ ! -f $HISTFILE ]; then
    touch $HISTFILE
fi

# ------
# Python
# ------
export PYTHONSTARTUP=${XDG_CONFIG_HOME}/python/pythonrc

# Add macOS Python site dir to PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="$PATH:${HOME}/Library/Python/3.9/bin"
fi

# ----
# Ruby
# ----
export GEM_HOME=${XDG_DATA_HOME}/gem
export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
export BUNDLE_USER_CONFIG=${XDG_CONFIG_HOME}/bundle
export BUNDLE_USER_CACHE=${XDG_CACHE_HOME}/bundle
export BUNDLE_USER_PLUGIN=${XDG_DATA_HOME}/bundle

RUBY_GEMS_DIR=${XDG_DATA_HOME}/gem/bin
if [ -d ${RUBY_GEMS_DIR}/ ]; then
    export PATH=$PATH:${RUBY_GEMS_DIR}
fi

# --------
# Homebrew
# --------
BREW_PATH=""
if [ -d /usr/local/Homebrew ]; then
    BREW_PATH=/usr/local/Homebrew
elif [ -d /opt/homebrew ]; then
    BREW_PATH=/opt/homebrew
elif [ -d /home/linuxbrew/.linuxbrew ]; then
    BREW_PATH=/home/linuxbrew/.linuxbrew
elif [ -d ${HOME}/homebrew ]; then
    BREW_PATH=${HOME}/homebrew
fi

if [ -n "$BREW_PATH" ]; then
    eval "$(${BREW_PATH}/bin/brew shellenv)"
fi

# ------------
# Java (macOS)
# ------------
OPENJDK_DIR=/usr/local/opt/openjdk/bin
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ -d ${OPENJDK_DIR}/ ]; then
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
export XAUTHORITY=${XDG_RUNTIME_DIR}/Xauthority

# -------
# Aliases
# -------
alias sshconfig="${EDITOR} ${HOME}/.ssh/config"
alias zshrc="${EDITOR} ${ZDOTDIR}/.zshrc"

# --------------------
# Aliases (Linux-only)
# --------------------
if [[ "$OSTYPE" == "linux"* ]]; then
    alias update="sudo apt update && sudo apt upgrade -y && sudo snap refresh"
fi

