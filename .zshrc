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

#alias ls='ls --color=auto'

# Color stuff
alias ls='exa -x --icons --git --group-directories-first'
alias la='exa -a -x --icons --git --group-directories-first'
alias grep='grep --color=auto'

# Cat with syntax highlighting
alias cat='source-highlight --failsafe --out-format=esc -o STDOUT -i'

# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "%B%F{yellow}%b%f "
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

NEWLINE=$'\n'

prompt='$NEWLINE%B%F{cyan}%~%f%b$NEWLINE${vcs_info_msg_0_}%F{green}%f%b '

# Simplify xbps commands
alias install="sudo xbps-install"
alias update="sudo xbps-install -Su"
alias query="xbps-query -Rs"
alias remove="sudo xbps-remove -R"

alias gi="git init"
alias gs="git status"
alias gd="git add"
alias gm="git commit"
alias gps="git push"
alias gpl="git pull"
alias gl="git log"

alias v="neovim"

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
	python -m venv "${HOME}"/.venv/"$1"
}

# Delete virtual environment
pydel ()
{
	echo "WARNING: You will permanently delete the Python virtual environment $1. Are you sure? (Y/N)"
	read -r user_input
	if [â ${user_input} = 'y' ]; then
		rm  "${HOME}"/.venv/"$1" -r
	fi
}

# Activate virtual environment
pyon ()
{
	source "${HOME}"/.venv/"$1"/bin/activate
}

# Deactivate virtual environment
alias pyoff="deactivate"

# Check list of virtual environments
pyls ()
{
	echo "List of Python virtual environments:"
	echo ${blue} > /dev/null
	ls "${HOME}"/.venv
	echo ${reset} > /dev/null
}

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

# Edit my config files
edit () {

    case $1 in
        "zsh")    nvim ~/.zshrc && \
                    source ~/.zshrc ;;

       "tmux")    nvim ~/.tmux.conf && \
                    tmux source-file ~/.tmux.conf ;;

      "bspwm")    nvim ~/.config/bspwm/bspwmrc && \
                    bspc wm -r ;;

      "sxhkd")    nvim ~/.config/sxhkd/sxhkdrc && \
                    pkill -USR1 -x sxhkd ;;

    "polybar")    nvim ~/.config/polybar/config && \
                    killall polybar && polybar mybar &;;

   "neofetch")    nvim ~/.config/neofetch/config.conf ;;

     "neovim")    nvim ~/.config/nvim/init.vim ;;

       "nvim")    nvim ~/.config/nvim/init.vim ;;

  "alacritty")    nvim ~/.config/alacritty/alacritty.yml ;;

      "dunst")    nvim ~/.config/dunst/dunstrc && \
                    killall dunst ;;

      "picom")    nvim ~/.config/picom/picom.conf ;;

    "zathura")    nvim ~/.config/zathura/zathurarc ;;
    esac
}

# fun pipes on the terminal
alias pipes="pipes.sh -c 2 -c 3 -f 60 -r 800"
alias pipeswarm="pipes.sh -c 1 -c 3 -f 60 -r 800"

# cool matrix effect
alias cmatrix="cmatrix -C green -u 10"

# redshift
alias redshift="redshift -l 14.599512:120.984222 &"

# Switch key
alias swapctrl="xmodmap ~/.config/i3/swapkeys -display :0 &"
export PATH=/home/angelo_f/.local/bin:$PATH

# Record video
alias rec="ffmpeg -video_size 1366x768 -framerate 30 -f x11grab -i :0.0 -pix_fmt yuv420p -c:v libx264 -preset ultrafast -y -v error -stats"

export GIT_EDITOR="nvim"

#. "$HOME/.cargo/env"
