if status is-interactive
    # Commands to run in interactive sessions can go here
end

# quotes from fortune
#fortune ~/.config/fortune/quotes

# supresses fish's intro message
set -g fish_greeting

# env
# https://wiki.archlinux.org/title/XDG_Base_Directory
# xdg
set -U XDG_DATA_HOME $HOME/.local/share
set -U XDG_CONFIG_HOME $HOME/.config
set -U XDG_CACHE_HOME $HOME/.cache
# python
set -U PYTHONPYCACHEPREFIX $HOME/.cache/python #~/.python_history
set -U PYTHONUSERBASE $HOME/python
# rclone
set -U RCLONE_CONFIG_DIR $HOME/.config/rclone
# browser
set -Ux BROWSER "flatpak run app.zen_browser.zen"

# startx
#alias s='startx ~/.config/X11/xinitrc'

# editor
alias vim='nvim'
alias n='nvim'
alias v='nvim'
alias sn='doas nvim'
alias sv='doas nvim'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

# get error messages from journalctl
alias jctl='journalctl -p 3 -xb'
alias cleanjctl='doas journalctl --vacuum-time=1days'

# commands
alias ls='lsd --group-directories-first'
alias l='ls -l'
alias la='ls -A'
alias lla='ls -lA'
#alias ls='ls -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ..='cd ..'
alias df='df -h'
alias free='free -h'
alias lsblk='lsblk -p'
alias zramctl='zramctl --output-all'
alias tree='tree -C'

# pacman
alias info='pacman -Si'
alias search='pacman -Ss'
alias files='pacman -Ql'
alias pkgs='pacman -Q | wc -l'
alias remove='doas pacman -Rns'
alias update='doas pacman -Syu'
alias pkginstall='doas pacman -S'
alias orphans='pacman -Qtd'
alias delorphans='doas pacman -Rns $(pacman -Qdtq)'
alias cleanpac='doas pacman -Scc'

# cache
alias cleancache='rm -rf ~/.cache/*'

# udisks
alias musb='udisksctl mount --block-device=/dev/sdb1'
alias umusb='udisksctl unmount --force --block-device=/dev/sdb1'
alias saferem='udisksctl power-off -b /dev/sdb1'

# rclone
alias gdrive='rclone mount --daemon --read-only --vfs-cache-mode full gdrive:/ /home/emilio/.cloud/gdrive'
alias dbox='rclone mount --daemon --read-only --vfs-cache-mode full dropbox:/ /home/emilio/.cloud/dropbox'
alias ugdrive='fusermount -u /home/emilio/.cloud/gdrive'
alias udbox='fusermount -u /home/emilio/.cloud/dropbox'

# rsync
#alias rsync='rsync --recursive --verbose -P'
