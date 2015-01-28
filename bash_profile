# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH:$HOME/.local/bin:$HOME/projects/android-sdk-linux/tools:$HOME/projects/android-sdk-linux/platform-tools:$HOME/android-studio/bin

if [ -f /usr/bin/vimx ]; then
	alias vim='vimx'
fi

export PATH
