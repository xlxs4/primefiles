I don't like newton notation ;)

I use GNU stow for managing dotfiles

---

Layout
- https://specifications.freedesktop.org/basedir-spec/latest/#variables
- https://wiki.archlinux.org/title/XDG_Base_Directory
- place local executables in $HOME/.local/bin
- place system-wide binaries in /usr/local/bin
- also refer to https://unix.stackexchange.com/questions/36871/where-should-a-local-user-executable-be-placed-under-home
- Example -- add this to rc: ```sh
  if [ -d "$HOME/.local/bin" ] ; then
      PATH="$HOME/.local/bin:$PATH"
  fi
  ```

Misc tools
- TODO: figure out installers
- sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt install -y stow strace
- wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
- tar -xzf ripgrep 
- mv ripgrep ... rg ~/.local/bin/
- rm -rf ripgrep ...

- mkdir ~/gh # for GitHub repos

GitHub CLI
- install gh the same way: https://github.com/cli/cli/releases/download/v2.76.1/gh_2.76.1_linux_amd64.tar.gz
- gh auth login
- cd && gh repo clone xlxs4/primefiles
- cd primefiles && stow .

Neovim
- install bob: https://github.com/MordechaiHadad/bob
- install neovim nightly: bob install nightly && bob use nightly
- if it didn't add to path automatically by editing your rc files, you need to essentially source "$HOME/.local/share/bob/env/env.sh"
- add completions for bob: https://github.com/MordechaiHadad/bob#-shell-completion

Funtoo Keychain (https://www.funtoo.org/Funtoo:Keychain)
- grab from https://github.com/funtoo/keychain/releases
- untar and rename to keychain from keychain.sh, move to path (~/.local/bin/)
- add eval `keychain --eval id_ed25519` in rc file

Julia
- curl -fsSL https://install.julialang.org | sh
- juliaup up / juliaup ls / juliaup add / juliaup default / juliaup st / juliaup rm

GPG
- `export GPG_TTY=$(tty)`
- Remember to call git config with the key

