
first_tmux_session() {
    tmux \
    new-session -d -n "nvim" \
        ~/.config/sxhkd/zsh-forever.sh ';' \
    attach ';'
}

while true
do
    export LANG="en_US.UTF-8"
    tmux attach || first_tmux_session
done
