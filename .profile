# EXPORTS #####################################################################

# XDG Base Directory Specification Paths
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_RUNTIME_DIR=/run/user/${UID}

# Environment
export LANG=en_US.UTF-8
export EDITOR='vim'

# ZSH
export ZSH=${XDG_DATA_HOME}/oh-my-zsh
export HISTFILE=${XDG_STATE_HOME}/zsh/history
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

# Ruby
export GEM_HOME=${XDG_DATA_HOME}/gem
export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
export BUNDLE_USER_CONFIG=${XDG_CONFIG_HOME}/bundle
export BUNDLE_USER_CACHE=${XDG_CACHE_HOME}/bundle
export BUNDLE_USER_PLUGIN=${XDG_DATA_HOME}/bundle

# Vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# Docker
export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker

# Less
export LESSHISTFILE=${XDG_CACHE_HOME}/less/history

# Python
export PYTHONSTARTUP=${XDG_CONFIG_HOME}/python/pythonrc
export KERAS_HOME=${XDG_STATE_HOME}/keras

# libdvdcss
export DVDCSS_CACHE=${XDG_DATA_HOME}/dvdcss

# GNUPG
export GNUPGHOME=${XDG_DATA_HOME}/gnupg

# ACTIONS #####################################################################

ZSH_STATE_DIR=${XDG_STATE_HOME}/zsh
LOCAL_BIN_DIR=${HOME}/.local/bin
BREW_PATH=""

# Try to find Homebrew
if [ -d /usr/local/Homebrew ]; then
    BREW_PATH=/usr/local/Homebrew
elif [ -d /opt/homebrew ]; then
    BREW_PATH=/opt/homebrew
elif [ -d /home/linuxbrew/.linuxbrew ]; then
    BREW_PATH=/home/linuxbrew/.linuxbrew
elif [ -d ${HOME}/homebrew ]; then
    BREW_PATH=${HOME}/homebrew
fi

# Create ZSH state directory and HISTFILE
if [ ! -d ${ZSH_STATE_DIR} ]; then
    mkdir -p ${ZSH_STATE_DIR}
fi

if [ ! -f $HISTFILE ]; then
    touch $HISTFILE
fi

# Add Homebrew to env
if [ -n "$BREW_PATH" ]; then
    eval "$(${BREW_PATH}/bin/brew shellenv)"
fi

# Add local path
if [ -d ${LOCAL_BIN_DIR} ]; then
    export PATH=$PATH:${LOCAL_BIN_DIR}
fi

