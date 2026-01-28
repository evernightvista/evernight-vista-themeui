# Copyright (C) 2006-2026 KairikiFedora All rights reserved.
function fish_greeting
    set codename (grep -E '^VERSION_CODENAME=' /usr/lib/os-release 2>/dev/null | cut -d '=' -f 2 | tr -d '"')
    if test -z "$codename"
        set codename "unknown"
    end
    set sysver (grep -E '^VERSION=' /usr/lib/os-release 2>/dev/null | cut -d '=' -f 2 | tr -d '"')
    if test -z "$sysver"
        set sysver "unknown"
    end
    set arch (uname -m)
    if test -z "$arch"
        set arch "unknown"
    end
    echo "Evernight Vista $sysver ($codename) $arch"
    echo "(C) 2006-2026 KairikiFedora All rights reserved."
end
alias cls="clear"
alias ls="lsd"
