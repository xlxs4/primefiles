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

- man pages: `$HOME/.local/share/man` (also update `$MANPATH`)

font
- Grab Commit Mono from https://commitmono.com/
- Unpack fonts to `~/.local/share/fonts`
- `fc-cache -f- v`

theme
- modus (vivendi) from Prot -- https://protesilaos.com/emacs/modus-themes
- for neovim: https://github.com/miikanissi/modus-themes.nvim
- there's a bunch of autogen themes in https://github.com/miikanissi/modus-themes.nvim?tab=readme-ov-file#extras
- colors can be found in https://github.com/miikanissi/modus-themes.nvim/blob/master/lua/modus-themes/colors.lua

Misc tools
- TODO: figure out installers
- TODO: completions
- TODO: shell configuration files
  -- it'd be nice if I had a server I could `scp` binaries from
  to other machines
- TODO: figure out SSH, GPG keys
- After setting up SSH for signing with GitHub, don't forget `ssh-add <SSH KEY>`
- TODO: figure out key remaps in a cross-platform way.
  We need:
  - caps mapped to ctrl/meta/super (probably meta)
  - caps acting as escape on single press for nvim/vim
  - `setxkbmap`, `xset`, `xcape`, `xdotool`, etc., is fine, but WSL2 uses Wayland :(
  - controls list: https://gist.github.com/matoken/5c2b9d2f0b92c21452cf8b4f01f7e149
  - things like `Super_L` will be extra challenging: https://unix.stackexchange.com/a/1686
  - also investigate things like https://gitlab.com/interception/linux/tools

```sh
sudo apt update && sudo apt upgrade -y && sudo apt install -y \
stow \
strace
```

ripgrep
- `wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz`
- `tar -xzf ripgrep`
- `mv ripgrep ... rg ~/.local/bin/`
- `rm -rf ripgrep ...`

bat
- https://github.com/sharkdp/bat/releases/download/v0.25.0/bat-v0.25.0-x86_64-unknown-linux-musl.tar.gz
- run `bat cache --build` so that bat recognizes the modus theme

eza
- https://github.com/eza-community/eza/releases/download/v0.23.0/eza_x86_64-unknown-linux-musl.tar.gz

hexyl
- https://github.com/sharkdp/hexyl/releases/download/v0.16.0/hexyl-v0.16.0-x86_64-unknown-linux-musl.tar.gz

fd
- https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz

jq
- https://github.com/jqlang/jq/releases/download/jq-1.8.1/jq-linux-amd64

tms
- https://github.com/jrmoulton/tmux-sessionizer/releases/download/v0.4.5/tmux-sessionizer-x86_64-unknown-linux-musl.tar.xz

yazi
- https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip 

zoxide
- https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
- [alias](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#flags) to cd: `eval "$(zoxide init --cmd cd zsh)"`

cloc
- https://github.com/AlDanial/cloc/releases/download/v2.06/cloc-2.06.tar.gz

universal-ctags
- https://github.com/universal-ctags/ctags-nightly-build/releases/download/2025.08.04%2B475a7bc246c22cb6ef1c6659103977a9de544667/uctags-2025.08.04-linux-x86_64.release.tar.gz


```bash
# https://yazi-rs.github.io/docs/quick-start/
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
```

mosh
- https://github.com/mobile-shell/mosh

TODO: other useful tools...

lazygit
- `wget https://github.com/jesseduffield/lazygit/releases/download/v0.53.0/lazygit_0.53.0_Linux_x86_64.tar.gz`
- install delta: https://github.com/dandavison/delta/releases/download/0.18.2/delta-0.18.2-x86_64-unknown-linux-gnu.tar.gz
- configure git to use delta with zdiff3: https://github.com/dandavison/delta#get-started
- Add delta to lazygit: https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Pagers.md#delta

install fzf
- `wget https://github.com/junegunn/fzf/releases/download/v0.65.0/fzf-0.65.0-linux_amd64.tar.gz`
- shell integration: https://github.com/junegunn/fzf#setting-up-shell-integration

- `mkdir ~/gh # for GitHub repos`
- NOTE: also used by `tms` (see `.config/tms/config.toml`)

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

Exports
```sh
export EDITOR=nvim
```

---

Back in the day, I actually tried to make Windows half usable.
That involves using the chocolatey package manager, a shitton of configurations, autohotkey, komorebi, gsudo, powertoys, dev drives, ...
I've given up.
The only way to tolerate working in Windows is WSL2 (aka not really working in Windows).
WSL2 is... okay? There's wslg for GUI/GPU stuff, some somewhat sensible defaults (e.g., localhost forwarding).
Still far, far from great.
Nowadays, I don't even use VSCode for WSL development.
VSCode has become extremely bloated.
Oh, and also, they bumped their glibc requirement: https://github.com/microsoft/vscode/issues/203375
So I can't use it in half the boxes I SSH into at work (yay aerospace).
[`code-server`](https://github.com/coder/code-server) is a somewhat better alternative.
I just use tmux + nvim/vim instead.
For the terminal, Alacritty is fine, the new terminal is also okay.
NOTE: For Alacritty, run `curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -` to install the needed terminfo
-- see https://github.com/alacritty/alacritty/issues/3962#issuecomment-862212371
Don't forget to always install the actually up-to-date Powershell.
The only exception to the rule of "try to do everything in WSL" is that Docker Desktop using WSL2 as its engine is more robust than running the docker service from Linux, especially if you start tinkering with stuff

`wsl.conf` file: https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconf
- should be stored in `/etc`
- support `systemd` (https://learn.microsoft.com/en-us/windows/wsl/wsl-config#systemd-support):
  ```toml
  [boot]
  systemd=true
  ```
- block the launch of Windows processes, block adding `$PATH` envvars (https://learn.microsoft.com/en-us/windows/wsl/wsl-config#interop-settings):
  ```toml
  [interop]
  enabled=false
  appendWindowsPath=false
  ```
- Change initial username (https://learn.microsoft.com/en-us/windows/wsl/wsl-config#user-settings):
  ```toml
  [user]
  default=xlxs4
  ```

all together:
```toml
[boot]
systemd=true

[interop]
enabled=false
appendWindowsPath=false

[user]
default=xlxs4
```

`.wslconfig` file: https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig
- Give WSL2 more resources (https://learn.microsoft.com/en-us/windows/wsl/wsl-config#main-wsl-settings):
  ```toml
  [wsl2]
  memory=12GB
  swap=16GB
  ```
- for the [experimental settings](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#experimental-settings), [this update](https://devblogs.microsoft.com/commandline/windows-subsystem-for-linux-september-2023-update/) is essential
- make WSL give resources back to Windows:
  ```toml
  [experimental]
  autoMemoryReclaim=gradual
  ```
- make networking suck less:
  ```toml
  [experimental]
  networkingMode=mirrored
  ```

There's another experimental flag which deserves at least a small rant.
Here it is:
```toml
sparseVhd=true
```

What is this you ask?
Well, WSL uses Virtual Hard Drives (VHDs) -- for more info see https://learn.microsoft.com/en-us/windows/win32/vstor/about-vhd?source=recommendations.
For some god-forsaken reason, these files never shrink back.
Never.
They just keep growing.
https://github.com/microsoft/WSL/issues/4699

This has, on many occasions, resulted in WSL hogging space on the 200-400 GB range.
Let that sink in.
Unreclaimable space.

Another brilliant aspect of the .vhdx files generated by WSL is that they didn't obey the [`swapFile`](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) flag, even if it was set.
I've had a lot of directories in `%temp%`, each with an accompanying vhdx.
Also, you can't easily have a big vhdx -- https://github.com/microsoft/WSL/issues/5476.

There's a cmdlet, [`Optimize-VHD`](https://learn.microsoft.com/en-us/powershell/module/hyper-v/optimize-vhd?view=windowsserver2025-ps), which you can use to shrink the file down.
Except it requires Hyper-V.
And that it doesn't really work most of the time.
And that if you set the file to be sparse (more on that below), you have to unset it, then run it, then set it back.
Using `diskpart` manually is more reliable.
Something akin to [`wslcompact`](https://github.com/okibcn/wslcompact) might better suit your needs

At this point, it should go without saying that `sparseVhd` isn't perfect, e.g.:
- https://github.com/microsoft/WSL/issues/10991
- https://github.com/microsoft/WSL/issues/12103

Aaaanyway, `</rant>`:
```toml
[experimental]
sparseVhd=true
```

all together:
```toml
[wsl2]
memory=12GB
swap=16GB

[experimental]
autoMemoryReclaim=gradual
networkingMode=mirrored
sparseVhd=true
```

---

MacOS

- System Settings -> Appearance -> Dark
- Install Xcode command tools -- needed for UNIX dev: `sudo xcode-select --install`
- install Homebrew: https://brew.sh
  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >> /Users/xlxs4/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/xlxs4/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ```
- Install Zen Browser: https://zen-browser.app/download/

- Consider installing BetterDisplay: https://github.com/waydabber/BetterDisplay

Browser Extensions
- Ublock Origin
- Dark Reader
- Bitwarden -- TODO: migrate to desktop/CLI, EU server, and cleanup
- Kagi
- Vimium C
- Enhancer for Youtube
- Google Scholar Button

- System Settings -> Security & Privacy -> FileVault -> Turn On
  - Create a recovery key and do not use my iCloud account
- System Settings -> Autofill & Passwords -> disable AutoFill passwords & passkeys
- System Settings -> Apple Intelligence & Siri -> Apple Intelligence -- OFF
- System Settings -> Apple Intelligence & Siri -> Siri Requests -> Siri -- OFF
- System Settings -> Desktop & Dock -> Automatically hide and show the Dock -- ON
- System Settings -> Desktop & Dock -> Minimize windows into application icon -- ON
- System Settings -> Desktop & Dock -> Animate opening applications -- OFF
- System Settings -> Desktop & Dock -> Show suggested and recent apps in Dock -- OFF
- System Settings -> Desktop & Dock -> Desktop & Stage Manager -> Click wallpaper to reveal Desktop -> Only in Stage Manager
- System Settings -> Desktop & Dock -> Desktop & Stage Manager -> Show items -> In Stage Manager
- System Settings -> Desktop & Dock -> Widgets -> Show Widgets -> In Stage Manager
- System Settings -> Desktop & Dock -> Default Web Browser -> Change to something other than Safari (Zen)
- System Settings -> Desktop & Dock -> Windows -> Prefer tabs when opening documents -- Always
- System Settings -> Desktop & Dock -> Windows -> Drag windows to screen edges to tile -- OFF
- System Settings -> Desktop & Dock -> Windows -> Drag windows to menu bar to fill screen -- OFF
- System Settings -> Desktop & Dock -> Windows -> Hold option key while dragging windows to tile -- OFF
- System Settings -> Desktop & Dock -> Windows -> Tiled windows have margins -- OFF
- System Settings -> Desktop & Dock -> Mission Control -> Drag windows to top of screen to enter Mission Control -- OFF
- System Settings -> Desktop & Dock -> Mission Control -> Hot Corners -- disable all
- System Settings -> Notifications -> Messages -> Play sound for notification -- OFF
- System Settings -> Keyboard -> Key repeat rate -- Fast
- System Settings -> Keyboard -> Delay until repeat -- Short
- System Settings -> Keyboard -> Delay until repeat -- Short
- System Settings -> Keyboard -> Shortcuts -> Show Spotlight search -- OFF
- System Settings -> Mouse -> Natural Scrolling -- OFF
- System Settings -> Sound -> Play sound on startup -- OFF
- System Settings -> Spotlight -> Help Apple Improve Search -- OFF
- System Settings -> Spotlight -> toggle OFF everything in "Search Results"
  also `sudo mdutil -i off /`
- Remove stuff you don't need from the dock
- Control Center -> Battery -> Show Percentage -- ON
  change what appears on the menubar, or use [Ice](https://github.com/jordanbaird/Ice) instead
- Right click on Downloads folder on Dock (if you're keeping that)
  - Display as: Stack
  - View content as: Grid
- Go to Finder -> Settings -> Sidebar: enable everything
  Advanced:
  - Show all filename extensions -- ON
  - Show warning before changing an extension -- OFF
  - When performing a search -- Search the Current Folder
- Go to Finder -> View:
  - Show Path Bar
  - Show Status Bar

- Show hidden files: `defaults write com.apple.finder AppleShowAllFiles YES`

- Install git -- MacOS comes with git by default, but it's an older version: `brew install git`
- Install [aerospace tiling WM](https://github.com/nikitabobko/AeroSpace): `brew install --cask nikitabobko/tap/aerospace`
- Install [GH CLI](https://cli.github.com/): `brew install gh`
- Install [Alacritty](https://alacritty.org/)

- Install stow: `brew install stow`
- Install wget: `brew install wget`
- Install tmux: `brew install tmux`
- Install zoxide: `brew install zoxide`
- Install fzf: `brew install fzf`
- Install tree: `brew install tree`
- Install [dmenu-mac](https://github.com/oNaiPs/dmenu-mac?tab=readme-ov-file): `brew install dmenu-mac`
- Install lazygit: `brew install lazygit`
- `brew install tmux-sessionizer`

- Install pwgen: `brew install pwgen`

For GPG:
```sh
if [ -r ~/.zshrc ]; then echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zshrc; \
  else echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zprofile; fi

brew install pinentry-mac
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
```

Consider installing Rosetta

