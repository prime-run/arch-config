# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# For HyDE not to touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.hyde.zshrc - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates

#  Plugins 
# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#  Aliases 
# Add aliases here

#  This is your file 
# Add your configurations here

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH_THEME="robbyrussell"
# bun completions
[ -s "/home/prime/.bun/_bun" ] && source "/home/prime/.bun/_bun"
alias ic="kitten icat"
#ezza
alias lss='eza -1 --icons=always --group-directories-first' 
alias l='eza -lh --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'
alias lt='eza --icons=auto --always'
alias s='sudo'
alias cdp='cd ~/Projects'
alias cdc='cd ~/.config'
#bat
alias bh='bat --color always -l help'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"



eval "$(/home/prime/.local/bin/togo completion zsh)"
eval "$(fzf --zsh)"
