#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Fun blue color for Bash prompt
#PS1='[\e[96m\]\u\e[0m:\e[96m\]\w\e[0m]\$ '
PS1='[\[\033[96m\]\u\[\033[0m\]:\[\033[96m\]\w\[\033[0m\]]$ '
# PS1='[\u:\w]\$ '

# Install package with pacman
pacstall ()
{
	sudo pacman -S -- "$1"
}

# Remove package with pacman
pacdel ()
{
	sudo pacman -R -- "$1"
}

# Update system with pacman
alias pacdate="sudo pacman -Syu"

# v for neovim
v ()
{ nvim -- "$1"
}

# Head into code directory
alias tocode="cd ~/code"

# Compile then run code on C
clangdo ()
{
	clang "$1" -o "$1".o && ./"$1".o
}

export PATH=/home/angelo_f/.local/bin:$PATH
