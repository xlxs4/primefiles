# Some good resources:
# - https://zsh.sourceforge.io/Guide/zshguide02.html#l9
# - https://grml.org/zsh/zsh-lovers.html

# Execution order of ZSH-related files:
# .zshenv -> [.zprofile if login] -> [.zshrc if interactive]
# -> [.zlogin if login] -> [.zlogout sometimes]

if [[ ! -o norcs ]]; then
  # XDG Base Directory Specification
  # https://specifications.freedesktop.org/basedir-spec/latest/
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
  export XDG_CONFIG_DIRS="/etc/xdg"

  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
  export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

  # I opted to store `PATH` in .zprofile instead of here.
  # 1) MacOS ships with a /etc/zprofile file that uses the path_helper
  # utility to set the path. (You can unset `GLOBAL_RCS` so that the system
  # configuration files don't override your settings)
  # 2) For that reason, .zshenv is loaded before the system path is loaded.
  # If you were to add homebrew to the PATH for an example, /usr/bin would
  # be prepended to /opt/homebrew/bin, causing system binaries to take
  # precedence over those installed with homebrew

  # Tell the shell that elements in the path array should be unique --
  # it should not add anything to it if it's already there.
  # The left-most occurrence is kept
  typeset -U path
fi

