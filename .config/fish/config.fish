source /usr/share/cachyos-fish-config/cachyos-config.fish

# disable fastfetch
function fish_greeting
end

COMPLETE=fish tms | source

alias cd='z'

# zoxide
zoxide init fish | source
