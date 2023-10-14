#Theme
ZSH_THEME=""


#Settings
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"


# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	systemd
	aliases
	archlinux
	colored-man-pages
	zsh-autosuggestions
	zsh-syntax-highlighting
)


#Autosuggesttions
ZSH_AUTOSUGGEST_STRATEGY="completion"


#zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern )

#You may need to manually set your language environment
export LANG=en_US.UTF-8


#Alias
alias -g nv="~/.local/bin/nvim-kitty_no-padding.sh"
alias -g nvim="~/.local/bin/nvim-kitty_no-padding.sh" 
alias bt="bluetoothctl power on && bluetoothctl"
alias -g gccomp="gcc -Wall -Wextra -std=c99 -Wpedantic -fsanitize=address,undefined,leak -g"
alias vpn="protonvpn-cli c -f"
alias archmaintain="sudo ~/.local/bin/archmaint.sh"
alias -g rm='echo "This is not the command you are looking for... Anyway, use backslash if you really want to."; false' # i'm using trash-cli
alias -g tp="trash-put"
eval $(thefuck --alias)


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


#Starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
