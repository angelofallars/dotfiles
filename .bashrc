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

blue="\e[0;96m"
reset="\e[0m"

# pfetch parameters
export PF_INFO="ascii title os kernel uptime pkgs memory wm"

# Run pfetch at start
pfetch

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

# Head into code directory and list contents
# alias tocode="cd ~/code && ls"
tocode ()
{
	cd ~/code && cd "$1" && ls
}

# v for neovim
v ()
{ 
	nvim -- "$1"
}

# open neovim in code directory
vopen ()
{
	nvim -- ~/code/"$1"
}

# Compile then run code in C
# Example: `crun hello.c`
#         =`clang hello.c -o c-hello.o` && 
#         =`./c-hello.o`
ccomp ()
{
	filename=$(echo "$1" | cut -f 1 -d '.')
	clang "$1" -o c-"$filename".o && echo -e "=== ${blue}$1${reset} -> ${blue}c-$filename.o${reset} ===" && ./c-"$filename".o
}

# Run already compiled code in C
crun ()
{
	filename=$(echo "$1" | cut -f 1 -d '.')
	./c-"$filename".o
}

# Shorthand for valgrind
cmem ()
{
	filename=$(echo "$1" | cut -f 1 -d '.')
	valgrind ./c-"$filename".o
}

# Shorthand name for running Python code
py ()
{
	python "$1"
}

# Create virtual environment
pymake ()
{
	python -m venv ~/venv/"$1"
}

# Delete virtual environment
pydel ()
{
	echo "WARNING: You will permanently delete the Python virtual environment $1. Are you sure? (Y/N)"
	read user_input
	if [ $user_input = 'y' ]; then
		rm  ~/venv/"$1" -r
	fi
}

# Activate virtual environment
pyon ()
{
	source ~/venv/"$1"/bin/activate
}

# Deactivate virtual environment
alias pyoff="deactivate"

# Make a new folder and initialize a git project there
gitdir ()
{
	mkdir "$1" && cd "$1" && git init && nvim
}

# Commit all in git
gitcom ()
{
	git commit -am "$1"
}

# Kill picom and polybar then run game 
rungame ()
{
	killall picom polybar
	gamemoderun "$1"
}

# Play a cute meow sound every time you use cat
catt ()
{
    # cat "$1" && echo -n "${PS1@P}" & mpv ~/Downloads/catmeow.mp3 > /dev/null 2>&1 &
    (cat "$1" && echo -n "${PS1@P}" & ) & (mpv ~/Downloads/catmeow.mp3 > /dev/null 2>&1 &)
}
alias cat="catt"

# Switch to international keyboard
intkey ()
{
    setxkbmap -layout us -variant intl
    xmodmap ~/.config/i3/swapkeys -display :0
}

# Switch to regular keyboard
uskey ()
{
    setxkbmap -layout us
    xmodmap ~/.config/i3/swapkeys -display :0
}

# edit then update this config
alias bashedit="nvim ~/.bashrc && source ~/.bashrc"

# Debug for someone's project
motive=true
if [[ -f ~/.motive.sh && $motive = true ]]; then
	bash ~/motive.sh
fi

export PATH=/home/angelo_f/.local/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
