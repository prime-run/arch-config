[ -s "/home/prime/.bun/_bun" ] && source "/home/prime/.bun/_bun"
alias ic="kitten icat"

alias ls='lsd --icon=never'
alias l=lsd
alias lt='lsd --tree'
alias ld='lsd --group-directories-first'

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
export EDITOR=nvim
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# eval "$(fzf --zsh)"

function fesf() {
	# [f]uzzy [e]dit  [s]earch [f]ile
	local initial_query="$1"
	local selected_file
	local find_command_output
	local fzf_args=()

	find_command_output=$(find . -maxdepth 5 -type f)

	if [[ -n "$initial_query" ]]; then
		echo "Listing files up to 5 levels deep, pre-filtered by \"$initial_query\" in fzf..."
		fzf_args+=("--query" "$initial_query")
	else
		echo "Listing all files up to 5 levels deep..."
	fi

	selected_file=$(echo "$find_command_output" | fzf "${fzf_args[@]}")

	if [[ -n "$selected_file" ]]; then
		nvim "$selected_file"
	else
		echo "No file selected."
		return 1
	fi

	return 0
}

function fod() {
	# [f]uzzy [o]pen [d]irectory
	local initial_query="$1"
	local selected_dir
	local find_command_output
	local fzf_args=()

	find_command_output=$(find . -maxdepth 5 -type d)

	if [[ -n "$initial_query" ]]; then
		fzf_args+=("--query" "$initial_query")
	else
		echo "Listing all directories up to 5 levels deep..."
	fi

	selected_dir=$(echo "$find_command_output" | fzf --preview 'ls {}' --preview-window right:60% "${fzf_args[@]}")

	if [[ -n "$selected_dir" ]]; then
		if $EDITOR "$selected_dir"; then
			echo "opened $(pwd)"
		else
			echo "Error: Could not open  \"$selected_dir\"."
			return 1
		fi
	else
		echo "No directory selected."
		return 1
	fi

	return 0
}

function fesfc() {
	# [f]uzzy [e]dit  [s]earch [f]ile [c]ontent
	local selected_file
	selected_file=$(grep -irl "${1:-}" ./ | fzf --preview 'bat --color always {}' --preview-window right:60%)

	if [[ -n "$selected_file" ]]; then
		nvim "$selected_file"
	else
		echo "No file selected or search returned no results."
	fi
}
