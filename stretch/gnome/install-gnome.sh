#!/bin/bash

SDIR=${0%/*}
LIB="../lib"
if [ -f "$LIB/tools.sh" ]; then
    . "$LIB/tools.sh"
fi

USER=$1
[[ -z "${USER// }" ]] && USER="linuser"
echo $USER

#testme ../gnome
#exit 0

## Skrypt musi być wykonany z konta roota!
## Katalog konfig: lista repozytoriów, ustawienia domyślne
install_tgz ../konfig
install_deb ../konfig

## Aktualizacja repozytoriów
apt-get update

## Instalacja narzędzi
NOREC="
gtk2-engines-murrine
"
install_pkg "$NOREC"

# instalowane z preseed.cfg:
#apt install sudo gksu mc rsync unrar tree geany geany-plugins terminator localepurge deborphan encfs firmware-linux-nonfree --yes
# extra
#apt install sylpheed sylpheed-i18n sylfilter --yes
TOADD="
vlc
filezilla
lxrandr
chromium
chromium-l10n
zim
dosemu
flashplayer-mozilla
flashplayer-chromium
gimp-plugin-registry
audacity
inkscape
libreoffice-style-sifr
ttf-mscorefonts-installer
breeze-icon-theme
gtk3-engines-breeze
"
install_list "$TOADD"

## Dodatkowee programy, konfiguracja
install_deb "../paczki"
apt --fix-broken install --yes
install_tgz "../paczki"

## Latest Firefox
# /bin/bash $SDIR/latest-firefox.sh install

install_tgz ../gnome

## Usunięcie niepotrzebnych pakietów
TOREMOVE="
"
purge_list "$TOREMOVE"

## Ponowna aktualizacja, czyszczenie
/bin/bash $LIB/sysupd.sh

## Optymalizacja
/bin/bash $LIB/optymalizuj.sh

# dodanie użytkownika do grupy sudo
usermod -a -G sudo $USER

# utworzenie katalogu bin i skopiowanie skryptu aktualizacji
if [ -f $LIB/sysupd.sh ]; then
    if [ ! -d "/home/$USER/bin" ]; then
        mkdir "/home/$USER/bin"
    fi
    cp -f "$LIB/sysupd.sh" "/home/$USER/bin"
    chown -R $USER:$USER "/home/$USER/bin"
    chmod a+x "/home/$USER/bin/sysupd.sh"
fi

rm -rf /.cache
exit 0
