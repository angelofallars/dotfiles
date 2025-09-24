# The following lines were added by compinstall
zstyle :compinstall filename '/home/angelo_f/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt beep extendedglob
unsetopt autocd nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

if [[ -n "$TMUX_PYTHON_VENV" ]]; then
    source "$TMUX_PYTHON_VENV"
fi

# Color stuff
alias ls='eza -x --icons --git --group-directories-first'
alias lst='eza -x --icons --git --group-directories-first -T --git-ignore'
alias l='ls'
alias la='eza -a -x --icons --git --group-directories-first --no-user'
alias ll='eza -l -x --icons --git --group-directories-first --no-user'
alias lla='eza -l -a -x --icons --git --group-directories-first --no-user'
alias cat='bat --theme="Catppuccin-mocha"'
alias grep='grep --color=auto'

alias py='ptpython'

# Enable substitution in the prompt.
setopt prompt_subst

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

# Convenient Git aliases
alias gin="git init"
gincd() {
    git init "$1" && cd "$1"
}

alias gcl="git clone"

alias ga="git add"
alias gau="git add -u"

alias gm="git commit"

alias gps="git push"
alias gpo="git push --set-upstream origin \$(git rev-parse --abbrev-ref HEAD)"
alias gpu="git push --set-upstream"
alias gpf="git push --force"

alias gpl="git pull"
alias gplo="git pull --set-upstream origin \$(git rev-parse --abbrev-ref HEAD)"
alias gplu="git pull --set-upstream"

# alias gaming
alias gmps="git commit && git push"
alias gmpo="git commit && git push --set-upstream origin \$(git rev-parse --abbrev-ref HEAD)"

alias gma="git commit --amend"
# The right man in the wrong place can make all the difference in the world.
alias gman="git commit --amend --no-edit"

gam() {
    git add "$@" && git commit
}
gama() {
    git add "$@" && git commit --amend
}
gaman() {
    git add "$@" && git commit --amend --no-edit
}
gampo() {
    git add "$@" && git commit && git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

alias ga.="git add ."
alias ga.m="git add . && git commit"
alias ga.ma="git add . && git commit --amend"
alias ga.man="git add . && git commit --amend --no-edit"
alias ga.mps="git add . && git commit && git push"
alias ga.mpo="git add . && git commit && git push --set-upstream origin \$(git rev-parse --abbrev-ref HEAD)"

alias gar='git add "$(git rev-parse --show-toplevel)/"'
alias garm='git add "$(git rev-parse --show-toplevel)/" && git commit'
alias garma='git add "$(git rev-parse --show-toplevel)/" && git commit --amend'
alias garman='git add "$(git rev-parse --show-toplevel)/" && git commit --amend --no-edit'
alias garmps='git add "$(git rev-parse --show-toplevel)/" && git commit && git push'
alias garmpo='git add "$(git rev-parse --show-toplevel)/" && git commit && git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

alias gs="git status"

alias gl="git log"
alias glo="git log --oneline"
alias gls="git log -n 1"
alias glg="git log --graph"
alias glog="git log --oneline --graph"
alias gloga="git log --oneline --graph --all"

alias grs="git restore"
alias grss="git restore --staged"

alias grs.="git restore ."
alias grss.="git restore --staged ."

alias grsr='git restore "$(git rev-parse --show-toplevel)/"'
alias grssr='git restore --staged "$(git rev-parse --show-toplevel)/"'

alias gd="git diff"
alias gds="git diff --staged"
alias gdm="git diff main || git diff master"
alias gd1="git diff HEAD~1"
alias gd2="git diff HEAD~2"
alias gd3="git diff HEAD~3"
alias gd4="git diff HEAD~4"
alias gd5="git diff HEAD~5"

alias gsh="git stash"
alias gshl="git stash list"
alias gsha="git stash apply"
alias gshp="git stash pop"

alias gmr="git merge"
alias grb="git rebase"
grib() {
    if [[ -n "$1" ]]; then
        git rebase -i HEAD~"$1"
    else
        git rebase -i --root
    fi
}

alias gmv="git mv"

alias grm="git rm"
alias grmc="git rm --cached"

alias gk="git cherry-pick"
alias gka="git cherry-pick --abort"

alias gf="git fetch"

alias gr="git remote"
alias grv="git remote --verbose"
alias gra="git remote add"
alias grao="git remote add origin"
alias grso="git remote set-url origin"

alias gb="git branch"
alias gbr="git branch --remote"
alias gbd="git branch --delete"

alias gw="git switch"
alias gwm="git switch main || git switch master"
alias gwn="git switch -c"
alias gwd="git switch --detach"

alias gc="git checkout"
alias gcb="git checkout -b"

alias gbl="git blame"

alias gcn="git config"

alias grr="git revert"

alias grt="git reset"
alias grts="git reset --soft"
alias grth="git reset --hard"

alias wcl="wc -l"

alias pm="pacman"
alias pmh="pacman -H"

alias pmv="sudo pacman --version"
alias pmd="sudo pacman --database"
alias pmf="sudo pacman --files"

alias pms="sudo pacman --sync"
alias pmsy="sudo pacman --sync --refresh"
alias pmsyu="sudo pacman -Syu"
alias pmup="pmsyu"
alias pmss="pacman --sync --search"

alias pmq="pacman --query"
alias pmqi="pacman --query --info"
alias pmql="pacman --query --list"

alias pmr="sudo pacman --remove"
alias pmt="pacman --deptest"
alias pmu="sudo pacman --upgrade"


# No pr because it conflicts with GNU pr
alias prh="paru -H"

alias prv="sudo paru --version"
alias prd="sudo paru --database"
alias prf="sudo paru --files"

alias prs="sudo paru --sync"
alias prsy="sudo paru --sync --refresh"
alias prsyu="sudo paru -Syu"
alias prup="prsyu"
alias prss="paru --sync --search"

alias prq="paru --query"
alias prqi="paru --query --info"
alias prql="paru --query --list"

alias prr="sudo paru --remove"
alias prt="paru --deptest"
alias pru="sudo paru --upgrade"

alias vim="nvim"
alias v="nvim"

alias lw="librewolf"

alias gdc="go doc -all -cmd"

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

      "ghostty")      nvim ~/.config/ghostty/config ;;

      "hypr")      nvim ~/.config/hypr/hyprland.conf ;;

    *)            echo "Can't find dotfile '$1'" ;;

    esac
}

installgame() {
    export WINEPREFIX=~/Games/"$1"
    winecfg
}

source ~/software/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh

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
export PATH="$PATH:/home/angelo-f/software/fzf-zsh-plugin/bin"

alias porth="porth -I $PORTH_STD"

export EZA_COLORS="di=32"

alias river="XKB_DEFAULT_OPTIONS=ctrl:nocaps river"

alias downloads="~/.config/waybar/scripts/downloads"

ras() {
    rye add $@ && ( echo Running "rye sync" ; rye sync )
}

source /home/angelo-f/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

source ~/.extra.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/angelo-f/google-cloud-sdk/path.zsh.inc' ]; then . '/home/angelo-f/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/angelo-f/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/angelo-f/google-cloud-sdk/completion.zsh.inc'; fi

export HISTFILESIZE=1000000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# bun completions
[ -s "/home/angelo-f/.bun/_bun" ] && source "/home/angelo-f/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin

[[ -s "/home/angelo-f/.gvm/scripts/gvm" ]] && source "/home/angelo-f/.gvm/scripts/gvm"

source "$HOME/.rye/env"

export PATH="$PATH:/home/angelo-f/.dotnet/tools"

export PATH="$PATH:/home/angelo-f/projects/personal/worldbanc/private/bin"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Usage: grab <username> <branch>
grab() {
  if [ $# -ne 1 ] || [[ ! "$1" =~ ^[^:]+:[^:]+$ ]]; then
    echo "Usage: grab <username>:<branch>"
    return 1
  fi

  local user="${1%%:*}"
  local branch="${1#*:}"

  # Get the repository name from the 'origin' remote
  local origin_url
  origin_url=$(git remote get-url origin 2>/dev/null)
  if [ -z "$origin_url" ]; then
    echo "Error: Not a git repository or no 'origin' remote."
    return 1
  fi

  # Extract the repository name from the SSH URL (assume only SSH is used)
  # Example: git@github.com:owner/repo.git
  local repo
  repo=$(echo "$origin_url" | sed -n 's#git@github\.com:[^/]*/\([^\.]*\)\.git#\1#p')
  if [ -z "$repo" ]; then
    echo "Error: Could not parse repository name from origin URL ($origin_url)"
    return 1
  fi

  # Add the remote if it doesn't exist, using SSH
  if ! git remote | grep -q "^$user\$"; then
    git remote add "$user" "git@github.com:$user/$repo.git"
  fi

  # Fetch the user's branch
  git fetch "$user" "$branch"

  # Switch to the remote branch directly (detached HEAD)
  git switch --detach "$user/$branch"
}

grabo() {
    grab "origin:$1"
}

# pnpm
export PNPM_HOME="/home/angelo-f/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
