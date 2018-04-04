#!/bin/bash

SDIR=${0%/*}
LIB="../lib"
if [ -f "$LIB/tools.sh" ]; then
    . "$LIB/tools.sh"
fi

function install_pip(){
    # Funkcja pomocnicza do instalacji narzędzi Pythona: pip, virtualenv
    # zakomentowano polecenia dla Pythona 2
    getpy="./get-pip.py"
    if [ -e $getpy ]; then
      #python $getpy
      #pip install virtualenv
      python3 $getpy
      pip3 install virtualenv
    else
      #apt install python-pip python-virtualenv
      apt install python3-pip python3-virtualenv --yes
    fi
}

function install_sqlitestudio(){
    # Funkcja pomocnicza do instalacji SQLiteStudio
    sqlstudio="./sqlitestudio-3.1.1.tar.xz"
    if [ -e $sqlstudio ]; then
      tar xJf $sqlstudio -C /opt
      chown -R root:root /opt/SQLiteStudio
      ln -s /opt/SQLiteStudio/sqlitestudio /usr/bin
      ln -s /opt/SQLiteStudio/sqlitestudiocli /usr/bin
    fi
}

## Instalacja edytora SublimeText
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
#echo "deb http://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
#apt update
# dodaj sublime-text do poniższej listy

## Instalacja edytora Atom
#curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
#sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
#apt update
# dodaj atom do poniższej listy

## Instalacja dodatkowych pakietów
## dostosuj listę, np.:
#sqlite3
#git
#qtcreator
#qt5-make
#qt5-default
#python-pyqt5
#python-pyqt5.qtsvg
#python-tk
#python3-pyqt5
#python3-pyqt5.qtsvg
#python3-tk
#python3-venv
#php-fpm
#php-gd
#php7.0-sqlite3
#php-json
TOADD="
codeblocks
g++
cppcheck
"
install_list "$TOADD"

###################################################
## Python
###################################################
## Instalacja narzędzi Pythona (pip, virtualenv)
install_pip

## Preferowany Python 3, polecenia dla Pythona 2 zakomentowano
## Instalacja rozszerzonej konsoli Pythona
#pip2 install ipython qtconsole
pip3 install ipython qtconsole
## Instalacja bibliotek Matplotlib i PyGame
#pip2 install pygame matplotlib
pip3 install pygame matplotlib

## Flask, Django, Peewee, SQLAlchemy – frameworki Pythona
#pip2 install flask django peewee sqlalchemy flask-sqlalchemy
#pip3 install flask django peewee sqlalchemy flask-sqlalchemy
## Sphinx – generator dokumentacji Pythona
#pip2 install sphinx sphinx-rtd-theme
#pip3 install sphinx sphinx-rtd-theme


###################################################
## Po umieszczeniu pakietów deb i/lub archiwów tgz
## w katalogu dev odkomentuj odpowiednie polecenia
## poniżej
###################################################
#install_deb ../dev
#install_tgz ../dev
#chown -R root:root "/etc/skel"

## Instalacja SQLiteStudio
install_sqlitestudio

## Instalacja VirtualBox
#echo "deb https://download.virtualbox.org/virtualbox/debian artful contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list && wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - && sudo apt update && sudo apt install virtualbox-5.2 --yes

###################################################
## Node.js, https://deb.nodesource.com
###################################################
# Ubuntu, Linux Mint
# curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
# Debian
#curl -sL https://deb.nodesource.com/setup_9.x | bash -
#sudo apt-get install -y nodejs

###################################################
## Serwery WWW
###################################################
## Opcjonalna kopia pliku konfiguracyjnego Hiawatha
#if [ -e /etc/hiawatha/hiawatha.conf ]; then
#  mv /etc/hiawatha/hiawatha.conf /etc/hiawatha/hiawatha.org
#fi

## Instalacja serwera Apache + PHP
## Konieczna jest konfiguracja opisana osobno w serwisie ecg.vot.pl, w skrócie:
#apt-get install apache2 php7.0 php7.0-gd php7.0-sqlite php7.0-curl php7.0-xml libapache2-mod-php7.0 --yes
#a2enmod rewrite userdir vhost_alias
#NOTICE: To enable PHP 7.0 FPM in Apache2 do:
#NOTICE: a2enmod proxy_fcgi setenvif
#NOTICE: a2enconf php7.0-fpm
#service apache2 restart
#zakomentować w mods-available/php5.conf

exit 0
