# Copyright (C) 2006-2026 KairikiFedora All rights reserved.
function fish_greeting
    set codename (grep -E '^VERSION_CODENAME=' /usr/lib/os-release 2>/dev/null | cut -d '=' -f 2 | tr -d '"')
    if test -z "$codename"
        set codename "unknown"
    end

    set sysver (grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' /usr/lib/fedora-release 2>/dev/null)
    if test -z "$sysver"
        set sysver "unknown"
    end

    set arch (uname -m)
    if test -z "$arch"
        set arch "unknown"
    end

    set is_root (whoami | grep -c '^root$')

    set red (set_color red)
    set reset (set_color normal)

    set greeting "Evernight Vista $sysver ($codename) $arch"
    if test $is_root -eq 1
        set greeting "$greeting $red(as root)$reset"
    end

    echo $greeting
    echo "(C) 2006-2026 KairikiFedora All rights reserved."
end

function ver
    set codename (grep -E '^VERSION_CODENAME=' /usr/lib/os-release 2>/dev/null | cut -d '=' -f 2 | tr -d '"')
    if test -z "$codename"
        set codename "unknown"
    end

    set sysver (grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' /usr/lib/fedora-release 2>/dev/null)
    if test -z "$sysver"
        set sysver "unknown"
    end

    set arch (uname -m)
    if test -z "$arch"
        set arch "unknown"
    end

    set is_root (whoami | grep -c '^root$')
    set red (set_color red)
    set reset (set_color normal)

    set greeting "Evernight Vista $sysver ($codename) $arch"
    if test $is_root -eq 1
        set greeting "$greeting $red(as root)$reset"
    end

    echo $greeting
end

alias cls="clear"
alias ls="lsd"
