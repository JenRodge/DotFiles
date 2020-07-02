#eval "$(starship init zsh)"
source ~/.promptline

# Vi mode
bindkey -v

setopt autocd
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
eval "$(thefuck --alias)"
eval "$(jump shell --bind=jumpto zsh)"

# Remove mode switching delay.
KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
ZLE_RPROMPT_INDENT=0

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -2t Primary || tmux new -2s Primary
    tmux rename-window zsh
fi

new-alias() { alias $@ && echo "alias $@" >> ~/.zshrc; }

colortest() {
	for x in {0..8}; do
		for i in {30..37}; do
			for a in {40..47}; do
				echo -ne "\033[$x;$i;$a""m\\\033[$x;$i;$a""m\033[0;39;49m "
			done
			echo -ne "\033[0;39;49m\n"
		done
		done
echo ""
}

j() {
    jumpto $*
    print -P %F{green}$(pwd)%f 
}

jexa() {
    j $*
    exa
}

alias exa='exa -aF'
alias lexa='exa -aghlF --git'
alias venv='python3 -m venv django; source /Users/Jen/repos/django/.venv/django/bin/activate'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias gdrive='cd /Volumes/GoogleDrive/My\ Drive'
alias reload='source ~/.zshrc'
alias ls='ls -G'

clear
neofetch
