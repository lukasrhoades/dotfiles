#!/usr/bin/env bash
DOTFILES="$HOME/dotfiles"

declare -A files=(
  ["$DOTFILES/alacritty/alacritty.toml"]="$HOME/.config/alacritty/alacritty.toml"
  ["$DOTFILES/nvim/init.lua"]="$HOME/.config/nvim/init.lua"
  ["$DOTFILES/ripgrep/.ripgreprc"]="$HOME/.ripgreprc"
  ["$DOTFILES/scripts/tmux-sessionizer.sh"]="$HOME/dotfiles/scripts/.tmux-sessionizer.sh"
  ["$DOTFILES/tmux/.tmux.conf"]="$HOME/.tmux.conf"
  ["$DOTFILES/zsh/.zshrc"]="$HOME/.zshrc"
)

for dotfile in "${!files[@]}"; do
  dest="${files[$dotfile]}"
  mkdir -p "$(dirname "$dest")"
  ln -sf "$dotfile" "$dest"
done

