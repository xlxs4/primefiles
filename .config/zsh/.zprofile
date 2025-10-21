if [ -x "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d "$HOME/.local/bin" ] ; then
    path+=("$HOME/.local/bin")
fi

if [ -d "$HOME/.julia/bin" ] ; then
    path+=("$HOME/.julia/bin")
fi

if [ -d "$HOME/.juliaup/bin" ]; then
    path+=("$HOME/.juliaup/bin")
fi

eval "$(keychain --eval id_ed25519)"

