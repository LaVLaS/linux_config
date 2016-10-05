# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#Stop Fedora from suggesting yum packages when entering a command that isn't found
unset command_not_found_handle

export HISTCONTROL=ignoredups:erasedups #No duplicate commands consecutively in bash history
export HISTSIZE=100000					#An elephant never forgets...unzip 100k commands
export HISTFILESIZE=100000				#History size matters
shopt -s histappend						#Append to bash_history

#PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
# After each command, append to the history file and reread it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}"

#POWERLINE STUFF
if hash powerline-daemon 2> /dev/null; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
else
  PS1="(\[\e[32;1m\]\w\[\e[37;1m\]) --> \[\e[0m\]"
fi

# If you want to specify a separate bash prompt for SSH connections
#if [ -n "$SSH_CLIENT" ]; then
#	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'
###	PS1="{\u@\[\033[33m*SSH*\033[0m\]\h \W}$ "
#	PS1='\[\e[1;33;40m\]\u@\h:\w *SSH* \[\e[0m\]'
#else
#	PS1="\[\e[37;1m\]\[\017\](\[\e[34;1m\]\u\[\e[1;37m\]@\[\e[34;1m\]\h\[\e[37;1m\])-(\[\e[32;1m\]\w\[\e[37;1m\])\n--> \[\e[0m\]"
#fi

# ALIASES
alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
alias cls='clear'
alias l.='ls -d .* --color=auto -F'
alias ll='ls -l --color=auto -F'
alias ls='ls --color=auto -F'

# We want the clipboard features that are compiled into the vimx
if [[ -f /usr/bin/vimx ]]; then
	alias vim='vimx'
fi

# nvim <-> neovim
if [[ -f $HOME/bin/nvim ]] || hash nvim 2> /dev/null; then
    alias neovim='nvim'
fi

EDITOR=vim


export PATH
export EDITOR

export VAGRANT_DEFAULT_PROVIDER=libvirt
export ANSIBLE_INVENTORY=~/ansible/ansible-hosts
