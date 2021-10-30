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

# Color stuff
alias ls='exa -x --icons --git --group-directories-first'
alias la='exa -a -x --icons --git --group-directories-first'
alias cat='source-highlight --failsafe --out-format=esc -o STDOUT -i'
alias grep='grep --color=auto'

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

# Simplify XBPS commands
alias install="sudo xbps-install"
alias update="sudo xbps-install -Su"
alias query="xbps-query -Rs"
alias remove="sudo xbps-remove -R"

# Update the current zsh shell
alias srcsh="source ~/.zshrc"

# Convenient Git aliases
# gm - git commit
# gma - git commit -a
#alias gm="gitcut"
#alias gma="gitcut"
alias ga="git add"

alias gps="git push"
alias gpl="git pull"

alias gin="git init"
alias gcl="git clone"

alias grv="git remote -v"
alias gra="git remote add"

alias gs="git status"
alias gl="git log"

alias grebase="git rebase"
alias gmerge="git merge"

alias ghelp="echo -n 'Git shortcuts:
gm    - git commit (optional message)
gma   - git commit -a
example: gma add new color options
output:  git commit -am \"Add new color options\"
example: gm add stuff ,, origin main
output:  git commit -m \"Add stuff\" && git push origin main

ga    - git add

gps   - git push
gpl   - git pull

gin   - git init
gcl   - git clone

gra   - git remote add
grv   - git remote -v

gs    - git status
gl    - git log

grebase  -  git rebase
gmerge   -  git merge

ghelp - show this help message
'"

alias v="nvim"

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

# Switch key
alias swapctrl="xmodmap ~/.config/i3/swapkeys -display :0 &"

# Record video
alias rec="ffmpeg -video_size 1366x768 -framerate 30 -f x11grab -i :0.0 -pix_fmt yuv420p -c:v libx264 -preset ultrafast -y -v error -stats"

export GIT_EDITOR="nvim"
export PATH=/home/angelo_f/.local/bin:$PATH
#. "$HOME/.cargo/env"
