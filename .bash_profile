[[ -s ~/.bashrc ]] && source ~/.bashrc

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


# Docker Commands
alias dc='docker-compose'
alias dc-run='docker-compose run default'
alias dc-up='docker-compose up -d && docker-compose logs'
alias dc-test='run ember test --serve --watcher polling'
alias dc-clean='docker rm -f $(docker ps -a -q) && docker rmi -f $(docker images -q) && rm -fr node_modules && rm -fr bower_components && rm -fr dist && rm -fr tmp'
