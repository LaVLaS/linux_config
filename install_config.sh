#! /usr/bin/bash


if [[ $# -ne 1 ]];
then
	echo "Need to specify desktop, laptop or dryrun"
	exit 1
fi

#PACKAGES required: vim-enhanced vim-Xll i3 i3lock i3status tmux rxvt-unicode-256color git
#Vim Vundle: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

TARGET=$1
echo "Target set to: $TARGET"

if [[ "$TARGET" != "desktop" ]] && [[ "$TARGET" != "laptop" ]] && [[ "$TARGET" != "dryrun" ]]
then
	echo "Argument must be desktop, laptop or dryrun"
	exit 1
fi

if [[ "$TARGET" == "dryrun" ]]
then
	SCRIPTACTION=echo
else
	SCRIPTACTION=eval
fi

echo "SCRIPTACTION set to $SCRIPTACTION"

echo "Installing configs for $TARGET"

MYTMP="$HOME/tmp/vimbackup"
if [[ ! -d "$MYTMP" ]]
then
	echo "Creating vimbackup directory: $MYTMP"
	mkdir -p "$MYTMP"
fi

for file in "tmux.conf" "bashrc" "bash_profile" "vimrc" "vim"
do
	TARGETFILE="$HOME/.$file"
	if [[ -e "$TARGETFILE" ]]
	then
		mv $TARGETFILE $TARGETFILE.old
	fi
	$SCRIPTACTION "ln -s $PWD/$file $TARGETFILE"
done


I3DIR="$HOME/.i3"
if [[ ! -d "$I3DIR" ]]
then
	$SCRIPTACTION "ln -s $PWD/i3 $I3DIR"
fi

$SCRIPTACTION "ln -s $PWD/i3/i3status_$TARGET.conf $HOME/.i3status.conf"
$SCRIPTACTION "ln -s $PWD/i3/config_$TARGET  $I3DIR/config"
$SCRIPTACTION "ln -s $PWD/$TARGET/gitconfig $HOME/.gitconfig"
$SCRIPTACTION "ln -s $PWD/$TARGET/Xresources $HOME/.Xresources"
