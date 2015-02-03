# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#Stop Fedora from suggesting yum packages when entering a command that isn't found
unset command_not_found_handle

PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'


if [ -n "$SSH_CLIENT" ]; then
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'
#	PS1="{\u@\[\033[33m*SSH*\033[0m\]\h \W}$ "
	PS1='\[\e[1;33;40m\]\u@\h:\w *SSH* \[\e[0m\]'
else
#	PS1="\e[1;37m\e[44m{\u@\h \W}\e[m$ "
	#PS1='\[\e[1;31;47m\]\w> \[\e[0m\]'
	PS1="\n\[\e[37;1m\]\[\017\](\[\e[34;1m\]\u@\h\[\e[37;1m\])-(\[\[\e[32;1m\]\w\[\e[37;1m\])\n(\[\e[32;1m\]\!\[\e[37;1m\])--> \[\e[0m\]"
fi

alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
alias cls='clear'
