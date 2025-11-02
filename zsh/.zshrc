autoload -U colors && colors
[[ $OSTYPE == "darwin"* ]] && PS1="%{$fg[magenta]%}%~%{$reset_color%} $ "
[[ $OSTYPE == "linux"* ]] && PS1="%{$fg[cyan]%}%~%{$reset_color%} $ "

bindkey -v

export EDITOR='nvim'
alias vim=nvim
export MANPAGER='nvim +Man!'

mkcd() {
  mkdir -p "$1" && cd "$1"
}
tmk() {
  for sesh in "$@"; do
    if tmux has-session -t "$sesh" 2>/dev/null; then
      tmux kill-session -t "$sesh"
    fi
  done
}

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export PATH="/Applications/Racket v8.18/bin:$PATH"

[[ $OSTYPE == "darwin"* ]] && source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ $OSTYPE == "linux"* ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
