[[ -s ~/.bashrc ]] && source ~/.bashrc

# Bash Shell Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function prompt {
	local BLACK="\[\033[0;30m\]"
	local BLACKBOLD="\[\033[1;30m\]"
	local RED="\[\033[0;31m\]"
	local REDBOLD="\[\033[1;31m\]"
	local GREEN="\[\033[0;32m\]"
	local GREENBOLD="\[\033[1;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local YELLOWBOLD="\[\033[1;33m\]"
	local BLUE="\[\033[0;34m\]"
	local BLUEBOLD="\[\033[1;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local PURPLEBOLD="\[\033[1;35m\]"
	local CYAN="\[\033[0;36m\]"
	local CYANBOLD="\[\033[1;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEBOLD="\[\033[1;37m\]"
	local RESETCOLOR="\[\e[00m\]"

	export PS1="\n$GREEN\u $WHITEBOLD@ $GREENBOLD\w\n $WHITEBOLD → $RESETCOLOR"
	export PS2="| → $RESETCOLOR"
}

prompt


PATH=$PATH:/usr/local/sbin


export NVM_DIR="/Users/mhuensch/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


alias sf=clifs
alias 'git:reset'='git reset --hard && git clean -fd'
