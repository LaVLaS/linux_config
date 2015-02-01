# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH:$HOME/.local/bin

if [[ -f `which vimx` ]]; then
	EDITOR=vimx
elif [[ -f `which vim` ]]; then
	EDITOR=vim
else
	EDITOR=vi
fi

if [ -f /usr/bin/vimx ]; then
	alias vim='vimx'
fi

export PATH
export EDITOR
