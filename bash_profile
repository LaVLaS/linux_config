# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH:$HOME/.local/bin

if [ -f /usr/bin/vimx ]; then
	alias vim='vimx'
fi

export PATH
