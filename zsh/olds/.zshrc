[ -s "/home/prime/.bun/_bun" ] && source "/home/prime/.bun/_bun"
alias ic="kitten icat"

#ezza
alias lss='eza -1 --icons=always --group-directories-first' 
alias l='eza -lh --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'
alias lt='eza --icons=auto --always'


#custom
alias s='sudo'
alias cdp='cd ~/Projects'
alias cdc='cd ~/.config'
alias y=yazi

#bat
alias bh='bat --color always -l help'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"


GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export EDITOR=nvim


# eval "$(uv generate-shell-completion zsh)"
# eval "$(uvx --generate-shell-completion zsh)"
#

eval "$(togo completion zsh)"
eval "$(fzf --zsh)"
