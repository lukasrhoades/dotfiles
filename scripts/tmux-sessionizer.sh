#!/usr/bin/env bash

DIRS=(
  "$HOME/Documents"
  "$HOME"
  "$HOME/Google Drive/Other computers/My MacBook Air"
)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find "${DIRS[@]}" -type d -maxdepth 1 \
    | sed "s|^$HOME||" \
    | fzf --margin 10% --color="bw")
  [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected_name"; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

session_name=$(tmux display-message -p "#S")
if [[ $session_name =~ ^[[:digit:]]+$ ]]; then
  tmp_session=true
fi

tmux switch-client -t "$selected_name"

if [[ $tmp_session = true && $(tmux list-clients -t $session_name | wc -l) -eq 0 ]]; then
  tmux kill-session -t "$session_name"
fi
