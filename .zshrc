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
bindkey -e
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
zstyle ':vcs_info:git*' formats "%B%F{green}%b%f "

# Just because you can, means you should 😹
declare -a cat_emojis
cat_emojis=(
    "🐱"
    "😻"
    "😼"
    "😺"
    "😹"
    "😸"
    "😾"
    "🙀"
    "😽"
    "😿"
)
declare -r cat_emojis

declare -a fruit_emojis
fruit_emojis=(
    "🍓"
    "🍊"
    "🍉"
    "🍇"
    "🍒"
    "🍍"
    "🍎"
    "🍋"
    "🥝"
    "🍌"
    "🍐"
    "🥭"
    "🍏"
    "🥑"
    "🫐"
    "🍈"
    "🥥"
)
declare -r fruit_emojis

precmd() {
    vcs_info

    new_prompt_cat=${cat_emojis[$(( $RANDOM % ${#cat_emojis[@]} + 1 ))]}

    # The next cat should be different from the last cat
    while [ "$new_prompt_cat" == "$prompt_cat" ]; do
        new_prompt_cat=${cat_emojis[$(( $RANDOM % ${#cat_emojis[@]} + 1 ))]}
    done

    prompt_cat=$new_prompt_cat
}

# Enable substitution in the prompt.
setopt prompt_subst

NEWLINE=$'\n'

prompt='%B%F{yellow}%~%f%b%  ${vcs_info_msg_0_}$prompt_cat '

if [[ "$TERM" == "linux" ]]; then
    prompt=' %B%F{yellow}%~%f%b%  ${vcs_info_msg_0_}>> '
fi

# Convenient Git aliases
alias ga="git add"
alias grm="git rm"
alias gm="git commit"

alias gps="git push"
alias gpl="git pull"
alias gf="git fetch"

alias gin="git init"
alias gcl="git clone"

alias gr="git remote"
alias grv="git remote --verbose"

alias gs="git status"
alias gl="git log"
alias gd="git diff"
alias gds="git diff --staged"
alias gd1="git diff HEAD~1"
alias gd2="git diff HEAD~2"
alias gd3="git diff HEAD~3"

alias gb="git branch"
alias gc="git checkout"

alias vim="nvim"

# Edit my config files
edit () {

    case $1 in
        "zsh")     nvim ~/.config/.zshrc && \
                     source ~/.zshrc ;;

       "tmux")     nvim ~/.config/.tmux.conf && \
                     tmux source-file ~/.tmux.conf ;;

      "bspwm")     nvim ~/.config/bspwm/bspwmrc && \
                     bspc wm -r ;;

      "sxhkd")     nvim ~/.config/sxhkd/sxhkdrc && \
                     pkill -USR1 -x sxhkd ;;

    "polybar")     nvim ~/.config/polybar/config.ini ;;

   "neofetch")     nvim ~/.config/neofetch/config.conf ;;

     "neovim")     nvim ~/.config/nvim/init.vim ;;

       "nvim")     nvim ~/.config/nvim/init.vim ;;

  "alacritty")     nvim ~/.config/alacritty/alacritty.yml ;;

      "dunst")     nvim ~/.config/dunst/dunstrc && \
                     killall dunst ;;

      "picom")     nvim ~/.config/picom/picom.conf ;;

    "zathura")     nvim ~/.config/zathura/zathurarc ;;

    "scripts")     nvim ~/.config/scripts/ ;;

       "rofi")     nvim ~/.config/rofi/config.rasi ;;

    "ncmpcpp")     nvim ~/.config/ncmpcpp/config ;;

       "cava")     nvim ~/.config/cava/config ;;

      "kitty")     nvim ~/.config/kitty/kitty.conf ;;

        "mpd")     nvim ~/.config/mpd/mpd.conf ;;

      "river")     nvim ~/.config/river/init ;;

     "waybar")     nvim ~/.config/waybar/config ;;

     "waybar-css") nvim ~/.config/waybar/style.scss ;;

      "foot")      nvim ~/.config/foot/foot.ini ;;

    *)            echo "Can't find dotfile '$1'" ;;

    esac
}

# Download from YouTube
yt-dl () {
    for link in "$@"
    do
        yt-dlp -x "ytsearch:$link" &
    done
}

# Write a quick "spell" to "cast" immediately
quick () {
    [ -e /tmp/quickcast.sh ] && rm /tmp/quickcast.sh
    nvim /tmp/quickcast.sh &&\
    [ -e /tmp/quickcast.sh ] && source /tmp/quickcast.sh
}

# Activate the scripts I wrote in .config/scripts
scripton () {
    ln -s $HOME/.config/scripts/$1 $HOME/.local/bin/ && echo "Script $1 activated."
}

# Record video
alias rec="ffmpeg -video_size 1366x300 -framerate 30 -f x11grab -i :0.0 -pix_fmt yuv420p -c:v libx264 -preset ultrafast -y -v error -stats"

# autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias discord="discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy > /dev/null 2>&1 & disown"

export GIT_EDITOR="nvim"
export PATH=/home/angelo_f/.local/bin:$PATH
#. "$HOME/.cargo/env"

# Created by `pipx` on 2021-11-09 19:31:24
export PATH="$PATH:/home/angelo-f/.local/bin"

export EXA_COLORS="di=33"

alias river="XKB_DEFAULT_OPTIONS=ctrl:nocaps river"

alias downloads="~/.config/waybar/scripts/downloads.py"

if [ -n "$TMUX" ]; then
    # colorscript random
    treefetch --bonsai
else
    # A nice lil bonsai shell for Rust lovers.
    treefetch --bonsai
fi

source /home/angelo-f/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
