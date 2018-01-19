# Narzedzia programistyczne

Skrypt `install-dev.sh` służy do instalacji narzędzi programistycznych. Domyślnie
instaluje:

- IDE Code::Blocks
- kompilator C++
- instalator pakietów i rozszerzoną konsolę Pythona (możesz zaktualizować [get-pip.py](https://bootstrap.pypa.io/get-pip.py))
- biblioteki Pythona: multimedialną PyGame, do tworzenia wykresów Matplotlib.

## Dodatkowe narzędzia:

**Uwaga**: przejrzyj i odkomentuj polecenia przed uruchomieniem.

- SublimeText – edytor programistyczny
- obsługę baz SQLite3 z linii poleceń
- obsługę systemu wersjonowania Git
- środowisko IDE QtCreator i biblioteki Pythona dla Qt
- dodatkowe biblioteki php wymagane przez niektóre CMS-y

## Inne narzędzia:

Skrypt może również zainstalować dodatkowe pakiety *deb* oraz rozpakować archiwa *tgz*
zawierające np. pliki konfiguracyjne. Pakiety i archiwa trzeba umieścić w katalogu `dev`.

- [Brackets](http://brackets.io/) – edytor kodu. **Uwaga**: do działania wymaga pakietu libgcrypt11 zawartego w pakiecie `a_libgcrypt11_1.5.0-5+deb7u6_amd64.deb` do pobrania np. ze strony [debian.pkgs.org](http://ftp.br.debian.org/debian-security/pool/updates/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u6_amd64.deb)
- [Atom](https://atom.io/) – edytor kodu
- [SQLiteStudio](https://sqlitestudio.pl/index.rvt?act=download) – graficzne narzędzie do zarządzania bazami danych SQLite3
- [Hiawatha](https://files.tuxhelp.org/hiawatha/) – szybki serwer WWW

### Archiwa konfiguracyjne

Pobierz odpowiednie [archiwum tgz](https://drive.google.com/open?id=1AqHKkHVE50Wsuk3AVUwdM7ePaTY-kLMp)
i umieść w katalogu `dev`.

**Uwaga**: zawartość pobranych archiwów zostanie rozpakowana do katalogu `/etc/skel`
i zostanie skopiowana automatycznie do katalogu domowego podczas dodawania nowego użytkownika.
