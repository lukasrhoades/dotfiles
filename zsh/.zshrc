autoload -U colors && colors
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$ "

bindkey -v

export EDITOR='nvim'
alias vim=nvim
export MANPAGER='nvim +Man!'

mkcd() {
  mkdir -p "$1" && cd "$1"
}

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

