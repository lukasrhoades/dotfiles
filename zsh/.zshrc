autoload -U colors && colors
[[ $OSTYPE == "darwin"* ]] && PS1="%{$fg[magenta]%}%~%{$reset_color%} $ "
[[ $OSTYPE == "linux"* ]] && PS1="%{$fg[cyan]%}%~%{$reset_color%} $ "

bindkey -v

export EDITOR="nvim"
alias vim=nvim
export MANPAGER="nvim +Man!"

alias ls="ls -lah"
alias mv="mv -i"
alias rm="rm -I"
alias cp="cp -i"
alias mkdir="mkdir -p"

[[ $OSTYPE == "linux"* && -f ~/dotfiles/zsh/.zshrc_local ]] && source ~/dotfiles/zsh/.zshrc_local

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
buntoo() {
  if [[ $(utmctl status buntoo) == "stopped" ]]; then
    utmctl start buntoo
  fi
  for i in {1..10}; do
    if [[ $(utmctl status buntoo) == "started" ]]; then
      ssh buntoo
      return
    fi
    sleep 2
  done
}
xutm() {
  utm_pid=$(pgrep UTM)
  if [[ -n $utm_pid ]]; then
    kill $utm_pid;
  fi
}

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export PATH="/Applications/Racket v8.18/bin:$PATH"

[[ $OSTYPE == "darwin"* ]] && source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ $OSTYPE == "linux"* ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
