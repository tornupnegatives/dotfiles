# XDG Base Directory Specification Paths
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_RUNTIME_DIR=/run/user/${UID}

# ZSH
export ZSH=${XDG_DATA_HOME}/oh-my-zsh
export HISTFILE=${XDG_STATE_HOME}/zsh/history
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

# Homebrew
eval "$(/usr/local/bin/brew shellenv)"

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
