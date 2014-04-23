# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
unset command_not_found_handle
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'

PS1="\n\[\e[37;1m\]\[\017\](\[\e[34;1m\]\u@\h\[\e[37;1m\])-(\[\[\e[32;1m\]\w\[\e[37;1m\])\n\#:\!-(\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[37;1m\])--> \[\e[0m\]"

alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
