#!/usr/bin/env zsh

function load_zsh_plugins {
    # Oh-my-zsh installation path
    zsh_paths=(
        "$HOME/.oh-my-zsh"
        "/usr/local/share/oh-my-zsh"
        "/usr/share/oh-my-zsh"
    )
    for zsh_path in "${zsh_paths[@]}"; do [[ -d $zsh_path ]] && export ZSH=$zsh_path && break; done
    # Load Plugins
    hyde_plugins=(git zsh-256color zsh-syntax-highlighting)
    plugins+=("${plugins[@]}" "${hyde_plugins[@]}" git zsh-256color zsh-syntax-highlighting)
    # Deduplicate plugins
    plugins=("${plugins[@]}")
    plugins=($(printf "%s\n" "${plugins[@]}" | sort -u))

    # Loads om-my-zsh
    [[ -r $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
}

# Function to handle initialization errors

# cleaning up home folder
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CONFIG_DIR="${XDG_CONFIG_DIR:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_DATA_DIRS="${XDG_DATA_DIRS:-$XDG_DATA_HOME:/usr/local/share:/usr/share}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DESKTOP_DIR="${XDG_DESKTOP_DIR:-$HOME/Desktop}"
XDG_DOWNLOAD_DIR="${XDG_DOWNLOAD_DIR:-$HOME/Downloads}"
XDG_TEMPLATES_DIR="${XDG_TEMPLATES_DIR:-$HOME/Templates}"
XDG_PUBLICSHARE_DIR="${XDG_PUBLICSHARE_DIR:-$HOME/Public}"
XDG_DOCUMENTS_DIR="${XDG_DOCUMENTS_DIR:-$HOME/Documents}"
XDG_MUSIC_DIR="${XDG_MUSIC_DIR:-$HOME/Music}"
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"
XDG_VIDEOS_DIR="${XDG_VIDEOS_DIR:-$HOME/Videos}"
LESSHISTFILE=${LESSHISTFILE:-/tmp/less-hist}
PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
# wget
# WGETRC="${XDG_CONFIG_HOME}/wgetrc"
SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc

export XDG_CONFIG_HOME XDG_CONFIG_DIR XDG_DATA_HOME XDG_STATE_HOME XDG_CACHE_HOME XDG_DESKTOP_DIR XDG_DOWNLOAD_DIR \
    XDG_TEMPLATES_DIR XDG_PUBLICSHARE_DIR XDG_DOCUMENTS_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_VIDEOS_DIR SCREENRC

if [ -t 1 ]; then
    # We are loading the prompt on start so users can see the prompt immediately

    eval "$(starship init zsh)"
    export STARSHIP_CACHE=~/.starship/cache
    export STARSHIP_CONFIG=~/.config/starship/starship.toml
    # Starship transient prompt functionality

    eval "$(fzf --zsh)"

    PM="pm.sh"
    # Try to find pm.sh in common locations
    if [ ! which "${PM}" ] &>/dev/null; then
        for path in "/usr/lib/hyde" "/usr/local/lib/hyde" "$HOME/.local/lib/hyde" "$HOME/.local/bin"; do
            if [[ -x "$path/pm.sh" ]]; then
                PM="$path/pm.sh"
                break
            fi
        done
    fi
    # Optionally load user configuration // useful for customizing the shell without modifying the main file
    [[ -f ~/.hyde.zshrc ]] && source ~/.hyde.zshrc

    # Load plugins
    load_zsh_plugins

    # Helpful aliases
    if [[ -x "$(which eza)" ]]; then
        alias l='eza -lh --icons=auto' \
            ll='eza -lha --icons=auto --sort=name --group-directories-first' \
            ld='eza -lhD --icons=auto' \
            lt='eza --icons=auto --tree'
    fi

    alias c='clear' \
        in='$PM install' \
        un='$PM remove' \
        up='$PM upgrade' \
        pl='$PM search installed' \
        pa='$PM search all' \
        vc='code' \
        fastfetch='fastfetch --logo-type kitty' \
        ..='cd ..' \
        ...='cd ../..' \
        .3='cd ../../..' \
        .4='cd ../../../..' \
        .5='cd ../../../../..' \
        mkdir='mkdir -p' # Always mkdir a path (this doesn't inhibit functionality to make a single dir)

    # Warn if the shell is slow to load
    autoload -Uz add-zsh-hook
fi
