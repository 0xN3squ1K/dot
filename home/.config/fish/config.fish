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
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_STATE_HOME $HOME/.local/state
set -Ux XDG_DATA_HOME $HOME/.local/share
# python
set -Ux PYTHON_HISTORY $XDG_STATE_HOME/python_history
set -Ux PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
set -Ux PYTHONUSERBASE $XDG_DATA_HOME/python
# rclone
set -Ux RCLONE_CONFIG_DIR $XDG_CONFIG_HOME/rclone
# browser
set -Ux BROWSER "flatpak run org.mozilla.firefox"

# startx
#alias s='startx ~/.config/X11/xinitrc'

# editor
alias vim 'nvim'
alias dvim 'doas nvim'

# confirm before overwriting something
alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -I'

# get error messages from journalctl
abbr jctl 'journalctl -p 3 -xb'
abbr cleanjctl 'doas journalctl --vacuum-time=1days'

# commands
#alias ls='lsd --group-directories-first'
alias l 'ls -l'
alias la 'ls '
alias lla 'ls -lA'
alias ls 'ls -hN --color=auto --group-directories-first'
alias grep 'grep --color=auto'
alias diff 'diff --color=auto'
alias .. 'cd ..'
alias df 'df -h'
alias free 'free -h'
alias lsblk 'lsblk -p'
alias zramctl 'zramctl --outputll'
alias tree 'tree -C'

# pacman
abbr info 'pacman -Si'
abbr search 'pacman -Ss'
abbr files 'pacman -Ql'
abbr pkgs 'pacman -Q | wc -l'
abbr remove 'doas pacman -Rns'
abbr update 'doas pacman -Syu'
abbr pkginstall 'doas pacman -S'
abbr orphans 'pacman -Qtd'
abbr delorphans 'doas pacman -Rns $(pacman -Qdtq)'
abbr cleanpac 'doas pacman -Scc'

# cache
abbr cleancache 'rm -rf ~/.cache/*'

# tmux
abbr tn 'tmux new-session -s'
abbr tl 'tmux list-sessions'
abbr ta 'tmux attach-session'

# INSTALL PACKAGES WITH FLATPAK
#abbr f 'flatpak install'
abbr fu 'flatpak update'
#abbr fr 'flatpak remove'
#abbr fs 'flatpak search'
abbr fcl 'flatpak uninstall --unused'
abbr fls 'flatpak list --columns=application'

# obsidian
alias ocheck 'rclone check --progress ~/Documents/obsidian encrypted-dropbox:obsidian'
alias osync 'rclone sync --progress ~/Documents/obsidian encrypted-dropbox:obsidian'

# fecha de la instalacion
abbr dateinstall 'stat / | grep -i birth'

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
