
first_tmux_session() {
    tmux \
    new-session -d \
        ~/.config/scripts/zsh-forever.sh ';' \
    attach ';'
}

while true
do
    export LANG="en_US.UTF-8"
    first_tmux_session
done
