# Snapshot = BaseInstall (no /boot)

## Pacstrap
+ base
+ linux
+ linux-firmware-{intel realtek nvidia} (linux-firmware-nvidia lo borre porque desactive la placa desde la bios)
+ btrfs-progs
+ intel-ucode

## Pacman
+ neovim
+ opendoas
+ fish
+ networkmanager
+ sbctl
+ zram-generator
+ bluez
+ snapper

## Services
+ systemctl enable NetworkManager.service
+ systemctl start /dev/zram0
+ systemctl enable bluetooth.service

## Obsidian
00 a 06
08 a 12
15, 17, 85, 87, 96

---

# Snapshot = GnomeInstall (no /boot)

## Pacman
+ tmux
+ gnome

## Services
+ systemctl enable gdm.service

## Obsidian
76

---

# Snapshot = NULL

## Pacman
+ usbguard
+ power-profiles-daemon
+ fwupd
+ system-config-printer
+ wl-clipboard
+ rclone
+ firewalld
    + firewall-config: Graphical user interface for firewallD
+ intel-media-driver
+ vulkan-intel
+ libva-utils (para comando vainfo)
+ pipewire-alsa
+ apparmor
+ file-roller (porque no puedo descomprimir rar's sino)
    + 7zip (no es opcionales para gnome, solo funcionan por cmd)
    + unrar (no es opcionales para gnome, solo funcionan por cmd)
+ git
+ ghostty
    + nautilus-python (para el menu contextual abrir en ghostty)
+ cups
    + cups-pdf
+ virt-manager
    + qemu-desktop (insala qemu-base)
    + dnsmasq (For network connectivity)
    + dmidecode
+ man-db
+ geary
+ gnome-tweaks
    + gnome-themes-extra (for darkmode geary, tambien funciona con la app refine)
+ fzf (para plugin fzf neovim)
+ ripgrep (para plugin fzf neovim, <leader>fg → buscar texto (usa rg))
+ fd (para plugin fzf neovim, <leader>ff → buscar archivos (usa fd si está instalado))
+ bat (para plugin fzf neovim,syntax highlighted previews when using fzf's native previewer)
+ make (para plugin treesitter)
+ gcc (para plugin treesitter)
+ npm (para plugin mason)
+ fuse2 (para appimages)
+ gst-libav (plugins para showtime)
+ gst-plugins-ugly (plugins para showtime, con este reproduce .wmv)
+ nss-mdns (para avahi - impresora)
+ syncthing
+ nm-connection-editor (para cambiar mi wifi a la zona 'home' de firewalld)
+ ntfs-3g (gnome-disk-utility)
+ dosfstools (gnome-disk-utility)

## Services
+ firewalld.service
+ apparmor.service
+ cups.socket
+ libvirtd.socket
+ avahi-daemon.socket
+ systemctl --user enable --now syncthing.service (sin doas porque es de usuario)

## Flatpaks
+ flatpak install flathub org.mozilla.firefox
+ flatpak install flathub md.obsidian.Obsidian
+ flatpak install flathub com.github.tchx84.Flatseal
+ flatpak install flathub com.bitwarden.desktop
+ flatpak install flathub be.alexandervanhee.gradia
+ flatpak install flathub com.spotify.Client
+ flatpak install flathub org.telegram.desktop
+ flatpak install flathub com.github.flxzt.rnote
+ flatpak install flathub org.localsend.localsend_app
+ flatpak install flathub page.tesk.Refine
+ flatpak install flathub com.github.johnfactotum.Foliate
+ flatpak install flathub com.vixalien.sticky
+ flatpak install flathub com.belmoussaoui.Authenticator
+ flatpak install flathub de.haeckerfelix.Fragments

## FONTS
+ ttf-iosevka-nerd
+ ttf-victor-mono-nerd

## AUR
+ fakeroot (https://aur.archlinux.org/neovim-nightly-bin.git) https://archlinux.org/packages/core/any/base-devel/
+ debugedit (https://aur.archlinux.org/neovim-nightly-bin.git)
- patch (Para nvidia aur)
- make (Para yay aur)
- gcc (Para yay aur)
