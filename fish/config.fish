set -g fish_greeting

source ~/.config/fish/hyde_config.fish

if type -q starship
    starship init fish | source
    set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
end


function fish_user_key_bindings
    # echo "fzf tests"
    # echo $EDITOR
    bind -M insert \ce '$EDITOR $(fzf --preview="bat --color=always --plain {}")' 
    # fzf + file preview => editor
    # FIX:  case : $EDITOR is not set
    # bind -M insert \ca 'cd $(find ./ -type d | fzf)'
end







fish_vi_key_bindings
set -g fish_autosuggestion_enabled 1
set fish_pager_color_prefix cyan
set fish_color_autosuggestion brblack



alias ls='lsd --icon=never'
alias l=lsd
alias lt='lsd --tree'
alias ld='lsd --group-directories-first'

alias s='sudo'
alias cdp='cd ~/Projects'
alias cdc='cd ~/.config'

alias y=yazi

#bat
alias bh='bat --color always -l help'
alias b='bat --plain'





# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

fzf --fish | source
