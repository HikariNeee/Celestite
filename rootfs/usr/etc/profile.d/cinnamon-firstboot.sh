if test "$(id -u)" -gt "0" && test -d "$HOME"; then
    if test ! -e "$HOME"/.config/autostart/cinnamon-firstboot.desktop; then
        mkdir -p "$HOME"/.config/autostart
        cp -f /usr/share//firstboot/cinnamon-firstboot.desktop "$HOME"/.config/autostart
    fi
fi
