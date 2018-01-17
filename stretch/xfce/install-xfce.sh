#!/bin/bash

SDIR=${0%/*}
LIB="../lib"
if [ -f "$LIB/tools.sh" ]; then
    . "$LIB/tools.sh"
fi

## Uwaga: podaj nazwę użytkownika jako argument skryptu
## lub wpisz nazwę użytkownika utworzonego podczas instalacji

USER=$1
[[ -z "${USER// }" ]] && USER="linuser"
echo $USER

## Skrypt musi być wykonany z konta roota!
## Katalog konfig: lista repozytoriów, ustawienia domyślne
install_tgz ../konfig
install_deb ../konfig

## Aktualizacja repozytoriów
apt-get update

## Pakiety do usunięcia
TOREMOVE="
xarchiver
"
purge_list "$TOREMOVE"

## Instalacja dodatkowych pakietów bez zależności
NOREC="
file-roller
gtk2-engines-murrine
"
install_pkg "$NOREC"

## Lista pakietów instalowanych w preseed.cfg:
## jeżeli nie używasz preceed.cfg, możesz odkomentować poniższe polecenie
#apt install sudo gksu mc rsync unrar tree geany geany-plugins terminator localepurge deborphan encfs firmware-linux-nonfree --yes

## Instalacja klienta poczty Sylpheed
#apt install sylpheed sylpheed-i18n sylfilter --yes

## Instalacja dodatkowych pakietów
TOADD="
vlc
gvfs-backends
galculator
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
viewnior
p7zip-full
yad
catfish
qt4-qtconfig
"
install_list "$TOADD"

###################################################
## Instalacja pakietów deb
## i rozpakowanie archiwów tgz z katalogu paczki
###################################################
install_deb "../paczki"
apt --fix-broken install --yes
install_tgz "../paczki"

###################################################
## Rozpakowanie archiwów tgz z katalogu xfce
## Prekonfiguracja lightdm,
###################################################
install_tgz ../xfce

## Ponowna aktualizacja, czyszczenie
/bin/bash $LIB/sysupd.sh

## Optymalizacja
/bin/bash $LIB/optymalizuj.sh

# dodanie użytkownika do grupy sudo
usermod -a -G sudo $USER

# utworzenie katalogu bin i skopiowanie skryptu aktualizacji
if [ -f $LIB/sysupd.sh ]; then
    [ ! -d "/home/$USER/bin" ] && mkdir "/home/$USER/bin"
    cp -f "$LIB/sysupd.sh" "/home/$USER/bin"
    chown -R $USER:$USER "/home/$USER/bin"
    chmod a+x "/home/$USER/bin/sysupd.sh"
fi

rm -rf /.cache
exit 0
