# The following lines were added by compinstall
zstyle :compinstall filename '/home/angelo_f/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob
unsetopt autocd nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install


if [[ -n "$TMUX_PYTHON_VENV" ]]; then
    source "$TMUX_PYTHON_VENV"
fi

# Color stuff
alias ls='exa -x --icons --git --group-directories-first'
alias l='ls'
alias la='exa -a -x --icons --git --group-directories-first'
alias ll='exa -l -x --icons --git --group-directories-first'
alias lla='exa -l -a -x --icons --git --group-directories-first'
alias cat='bat --theme="Catppuccin-mocha"'
alias grep='grep --color=auto'

alias py='ptpython'

# Enable substitution in the prompt.
setopt prompt_subst

# Convenient Git aliases
alias ga="git add"
alias gaa="git add ."
alias gm="git commit"
alias gma="git commit --all"

alias grm="git rm"
alias gmv="git mv"

alias gma="git commit --all"

alias grs="git restore"
alias grss="git restore --staged"

alias gps="git push"
alias gpl="git pull"
alias gf="git fetch"

alias gpsu="git push -u origin main"

alias gin="git init"
alias gcl="git clone"

alias gr="git remote"
alias grv="git remote --verbose"
alias grao="git remote add origin"
alias grso="git remote set-url origin"

alias gs="git status"
alias gl="git log"
alias gli="git log --oneline"
alias gd="git diff"
alias gds="git diff --staged"
alias gd1="git diff HEAD~1"
alias gd2="git diff HEAD~2"
alias gd3="git diff HEAD~3"

grib() {
    if [[ -n "$1" ]]; then
        git rebase -i HEAD~"$1"
    else
        git rebase -i --root
    fi
}

gll() {
    git log -L"$2",+1:"$1"
}

alias gb="git branch"
alias gbr="git branch --remote"
alias gc="git checkout"

alias vim="nvim"
alias v="nvim"

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

     "neovim")     nvim ~/.config/nvim/init.lua ;;

       "nvim")     nvim ~/.config/nvim/init.lua ;;

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

      "openmw")      nvim ~/.config/openmw/openmw.cfg ;;

      "wezterm")      nvim ~/.config/wezterm/wezterm.lua ;;

      "hypr")      nvim ~/.config/hypr/hyprland.conf ;;

    *)            echo "Can't find dotfile '$1'" ;;

    esac
}

installgame() {
    export WINEPREFIX=~/Games/"$1"
    winecfg
}

alias pdb="python -m pdb"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias discord="discord --ignore-gpu-blocklist --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy > /dev/null 2>&1 & disown"

export GIT_EDITOR="nvim"
export PATH=/home/angelo_f/.local/bin:$PATH

# Created by `pipx` on 2021-11-09 19:31:24
export PATH="$PATH:/home/angelo-f/.local/bin"

export PATH="$PATH:/home/angelo-f/go/bin"

export PATH="$PATH:/home/angelo-f/software/couch-porth"
export PORTH_STD="/home/angelo-f/software/couch-porth/std/"

alias porth="porth -I $PORTH_STD"

export EXA_COLORS="di=32"

alias river="XKB_DEFAULT_OPTIONS=ctrl:nocaps river"

alias downloads="~/.config/waybar/scripts/downloads"

alias smth="env MOZ_ENABLE_WAYLAND=1 /usr/lib/librewolf/librewolf -p 'Something' %u 2>&1 & disown"

source /home/angelo-f/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/angelo-f/google-cloud-sdk/path.zsh.inc' ]; then . '/home/angelo-f/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/angelo-f/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/angelo-f/google-cloud-sdk/completion.zsh.inc'; fi
