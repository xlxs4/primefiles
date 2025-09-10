export EDITOR=nvim
export GPG_TTY=$(tty)

alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'

alias vim='nvim'

alias ls='eza'
alias ll='eza -alF'
alias la='eza -A'

# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#flags
eval "$(zoxide init --cmd cd zsh)"

# https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
source <(fzf --zsh)
source "$HOME/.local/share/bob/env/env.sh"

# https://yazi-rs.github.io/docs/quick-start/
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if IFS= read -r -d '' cwd < "$tmp"; then
    if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
  fi
  rm -f -- "$tmp"
}

source ~/.cargo/env

path=('/Users/xlxs4/.juliaup/bin' $path)
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
