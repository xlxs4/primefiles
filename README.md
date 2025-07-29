I don't like newton notation ;)

I use GNU stow for managing dotfiles

---

Layout
- https://specifications.freedesktop.org/basedir-spec/latest/#variables
- https://wiki.archlinux.org/title/XDG_Base_Directory
- place local executables in `$HOME/.local/bin`
- place system-wide binaries in `/usr/local/bin`
- also refer to https://unix.stackexchange.com/questions/36871/where-should-a-local-user-executable-be-placed-under-home
- Example -- add this to rc:
  ```sh
  if [ -d "$HOME/.local/bin" ] ; then
      PATH="$HOME/.local/bin:$PATH"
  fi
  ```

font
- Grab Commit Mono from https://commitmono.com/
- Unpack fonts to `~/.local/share/fonts`
- `fc-cache -f- v`

Misc tools
- TODO: figure out installers
- `sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt install -y stow strace`
- `wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz`
- `tar -xzf ripgrep`
- `mv ripgrep ... rg ~/.local/bin/`
- `rm -rf ripgrep ...`

bat
- https://github.com/sharkdp/bat/releases/download/v0.25.0/bat-v0.25.0-x86_64-unknown-linux-musl.tar.gz

eza
- https://github.com/eza-community/eza/releases/download/v0.23.0/eza_x86_64-unknown-linux-musl.tar.gz

hexyl
- https://github.com/sharkdp/hexyl/releases/download/v0.16.0/hexyl-v0.16.0-x86_64-unknown-linux-musl.tar.gz

TODO: other useful tools...

Lazygit
- `wget https://github.com/jesseduffield/lazygit/releases/download/v0.53.0/lazygit_0.53.0_Linux_x86_64.tar.gz`
- install delta: https://github.com/dandavison/delta/releases/download/0.18.2/delta-0.18.2-x86_64-unknown-linux-gnu.tar.gz
- configure git to use delta with zdiff3: https://github.com/dandavison/delta#get-started
- Add delta to lazygit: https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Pagers.md#delta

install fzf
- `wget https://github.com/junegunn/fzf/releases/download/v0.65.0/fzf-0.65.0-linux_amd64.tar.gz`
- shell integration: https://github.com/junegunn/fzf#setting-up-shell-integration

- `mkdir ~/gh # for GitHub repos`

GitHub CLI
- install gh the same way: https://github.com/cli/cli/releases/download/v2.76.1/gh_2.76.1_linux_amd64.tar.gz
- `gh auth login`
- `cd && gh repo clone xlxs4/primefiles`

Dotfiles management
- `cd primefiles && stow .`
- TODO: consider using [`--dotfiles`](https://www.gnu.org/software/stow/manual/stow.html)

Neovim
- install bob: https://github.com/MordechaiHadad/bob
- install neovim nightly: bob install nightly && bob use nightly
- if it didn't add to path automatically by editing your rc files, you need to essentially source "$HOME/.local/share/bob/env/env.sh"
- add completions for bob: https://github.com/MordechaiHadad/bob#-shell-completion
- vim-plug:
  ```sh
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ```

Funtoo Keychain (https://www.funtoo.org/Funtoo:Keychain)
- grab from https://github.com/funtoo/keychain/releases
- untar and rename to keychain from keychain.sh, move to path (~/.local/bin/)
- add "eval `keychain --eval id_ed25519`" in rc file

Julia
- curl -fsSL https://install.julialang.org | sh
- juliaup up / juliaup ls / juliaup add / juliaup default / juliaup st / juliaup rm

GPG
- `export GPG_TTY=$(tty)`
- Remember to call git config with the key

Aliases
```sh
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'

alias vim='nvim'

alias ls='eza'
alias ll='eza -alF'
alias la='eza -A'
```

