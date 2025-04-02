#
# ~/.bashrc

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Load bash completions from personal directory
# if [ -d "$HOME/.bash_completion.d" ]; then
#     for completion in "$HOME/.bash_completion.d/"*; do
#         [ -f "$completion" ] && source "$completion"
#     done
# fi
# eval "$(/home/prime/.local/bin/togo completion zsh)"

eval "$(togo completion bash)"
