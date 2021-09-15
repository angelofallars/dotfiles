# The following lines were added by compinstall
zstyle :compinstall filename '/home/angelo_f/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob
unsetopt autocd nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'

# Fun blue color for Bash prompt
#PS1='[\e[96m\]\u\e[0m:\e[96m\]\w\e[0m]\$ '
#PS1='[\[\033[96m\]\u\[\033[0m\]:\[\033[96m\]\w\[\033[0m\]]$ '
# PS1='[\u:\w]\$ '
# PS1='\[\033[96m\] \w\[\033[0m\] >> '
PS1=' %F{red}%f %~ %F{blue}%f '

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
# alias tocode="cd "${HOME}"/code && ls"
tocode ()
{
	cd "${HOME}"/code && cd "$1" && ls
}

# v for neovim
v ()
{
	nvim -- "$1"
}

# open neovim in code directory
vopen ()
{
	nvim -- "${HOME}"/code/"$1"
}

# Compile then run code in C
# Example: `crun hello.c`
#		 =`clang hello.c -o c-hello.o` &&
#		 =`./c-hello.o`
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
	python -m venv "${HOME}"/venv/"$1"
}

# Delete virtual environment
pydel ()
{
	echo "WARNING: You will permanently delete the Python virtual environment $1. Are you sure? (Y/N)"
	read -r user_input
	if [ ${user_input} = 'y' ]; then
		rm  "${HOME}"/venv/"$1" -r
	fi
}

# Activate virtual environment
pyon ()
{
	source "${HOME}"/venv/"$1"/bin/activate
}

# Deactivate virtual environment
alias pyoff="deactivate"

# Check list of virtual environments
pyls ()
{
	echo "List of Python virtual environments:"
	echo ${blue} > /dev/null
	ls "${HOME}"/venv
	echo ${reset} > /dev/null
}

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
	# cat "$1" && echo -n "${PS1@P}" & mpv "${HOME}"/Downloads/catmeow.mp3 > /dev/null 2>&1 &
	(cat "$1" && echo -n "${PS1@P}" & ) & (mpv "${HOME}"/Downloads/catmeow.mp3 > /dev/null 2>&1 &)
}
# Comment out cat for now to prevent another forkbomb lmao
# alias cat="catt"

# Switch to international keyboard
intkey ()
{
	setxkbmap -layout us -variant intl
	xmodmap "${HOME}"/.config/i3/swapkeys -display :0
}

# Switch to regular keyboard
uskey ()
{
	setxkbmap -layout us
	xmodmap "${HOME}"/.config/i3/swapkeys -display :0
}

# Switch between US and International keyboards smartly
switchkey ()
{
	current_key=$(cat "${HOME}"/.config/switchkey/current_key)

	# To International keyboard layout
	if [[ $current_key == "us" ]]; then
		setxkbmap -layout us -variant intl
		xmodmap "${HOME}"/.config/i3/swapkeys -display :0

		echo "Switched to International keyboard. Hola mundo!"
		echo "intl" > "${HOME}"/.config/switchkey/current_key

	# To US keyboard layout
	else
		setxkbmap -layout us
		xmodmap "${HOME}"/.config/i3/swapkeys -display :0

		echo "Switched to US keyboard. Hello world!"
		echo "us" > "${HOME}"/.config/switchkey/current_key
	fi
}

# Music player
alias music=cmus

# File manager
alias files=ranger

# COVID-19 stats
alias covidstats="curl https://covid19-cli.wareneutron.com/philippines"

# neofetch alias
alias nf="neofetch"

# gradient neofetch
alias aquafetch="neofetch | lolcat --freq=0.08 --seed=32"

# redshift
alias redshift="redshift -l 14.599512:120.984222 &"

# edit then update this config
alias bashedit="nvim "${HOME}"/.bashrc && source "${HOME}"/.bashrc"

# lock the screen
alias lock="i3lock -i ~/Pictures/randomnoise.png --{inside,ring}-color=282c3499 --{inside,ring}ver-color=61afefaa --{key,bs}hl-color=61afefff --separator-color=61afefff --line-uses-inside --{layout,time,date,greeter,verif,wrong,modif}-color=abb2bfff --{inside,ring}wrong-color=e06c75aa --{time,date,layout,verif,wrong,greeter}-font=\"JetBrains Mono\" -k --radius 108 --ring-width 12"

# fun pipes on the terminal
alias pipes="pipes.sh -c 2 -c 6 -f 60 -r 800"

# cool matrix effect
alias cmatrix="cmatrix -C cyan -u 10"

export PATH=/home/angelo_f/.local/bin:$PATH

. "$HOME/.cargo/env"
