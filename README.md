# Debian

Skrypty dostosowujące instalację Debiana

## Wspierana wersja

Debian Stretch (9), amd64

## Pobieranie repozytorium

Repozytorium można pobrać jako [archiwum zip](https://github.com/xinulsw/debinstall/archive/master.zip),
które należy później rozpakować.

Repozytorium można również sklonować wydając polecenie w terminalu:

```bash
git clone https://github.com/xinulsw/debian.git
```

## Przygotowanie instalacyjnego pendrajwa

Pobieramy wybrany obraz instalacyjny, np. CD [debian-9.3.0-amd64-xfce](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.3.0-amd64-xfce-CD-1.iso)
ze środowiskiem XFCE lub DVD [debian-9.3.0-amd64-DVD-1](https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-9.3.0-amd64-DVD-1.iso)
zawierający więcej środowisk graficznych do wyboru.

Pobrany plik *iso* najwygodniej wypalić na pendrajwie za pomocą programu [Rufus](https://rufus.akeo.ie/),
który działa pod systemem Windows ;-).


## Instalacja nienadzorowana

Jeżeli podczas instalacji nie chcemy odpowiadać na pytania dotyczące języka,
klawiatury, strefy czasowej, nazwy komputera, kont użytkowników itp. – możemy użyć
pliku odpowiedzi. W katalogu `konfig/preseed` znajdziesz dwa pliki, `preseed_xfce.cfg`
i `preseed_gnome.cfg` – różnią się tylko domyślnie instalowanym środowiskiem graficznym.

1. Wybrany plik odpowiedzi umieszczamy w głównym katalogu pendrajwa pod nazwą `preseed.cfg`.
2. Ustawienia domyślne, które można, a czasem trzeba dostosować:
  - *debian000* – nazwa komputera,
  - *szkola.org* – nazwa domeny,
  - *linuser* – login konta użytkownika tworzonego podczas instalacji,
  - *xzsawq21* – hasło roota i domyślnego użytkownika,
  - */dev/sda* – wskazanie pierwszego dysku do instalacji menedżera GRUB.

3. Aby wykorzystać plik odpowiedzi, trzeba zmienić polecenia uruchamiające instalator.
W tym celu z katalogu `isolinux` na pendrajwie otwieramy pliki `gtk.cfg` i `txt.cfg`,
a następnie modyfikujemy linię dołączającą opcjonalne parametry kernela zgodnie z poniższym przykładem:

 ```bash
 append preseed/file=/cdrom/preseed.cfg locale=pl_PL.UTF-8 keymap=pl language=pl country=PL vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet
 ```
4. Uruchamiamy komputer z przygotowanego pendrajwa i wybieramy instalację najlepiej w trybie tekstowym.

**Uwaga**: partycje do instalacji systemu trzeba wskazać ręcznie!

## Konfiguracja systemu

Po zainstalowaniu i zalogowaniu się na konto użytkownika utworzone podczas instalacji
(domyślnie *linuser*) podłącz pendrajwa z wgranym katalogiem `stretch` (ze sklonowanego
repozytorium) i przy użyciu menedżera plików skopiuj go do katalogu domowego.
Odmontuj pendrajwa, wyloguj się ze środowiska graficznego i przejdź do
konsoli naciskając `CTRL+ALT+F2`. Zaloguj się na konto użytkownika (*linuser*),
wejdź do katalogu `strech` i wydaj polecenie, które nada prawa uruchamiania
skryptom instalacyjnym:

```bash
cd strech
find . -type -f -name "*.sh" -exec chmod a+x {} \;
```

Następnie wejdź do katalogu wybranego środowiska, uzyskaj uprawnienia roota i uruchom skrypt, np.:

```bash
cd xfce
su - root
./install-xfce.sh linuser
```

## Dostosowanie skryptów instalacyjnych/konfiguracyjnych

Kolejnym krokiem może być uruchomienie skryptów instalujących narzędzia programistyczne
i/lub edukacyjne. Za każdym razem wchodzimy do odpowiedniego katalogu i uruchamiamy
z konta roota skrypt instalacyjny, np.:

```bash
cd ../dev
./install-dev.sh linuser
cd ../edu
./install-edu.sh
```

**Uwaga**: Zanim użyjesz skryptów z pokatalogów `dev` i `edu` folderu `stretch`
przejrzyj je i dostosuj do własnych potrzeb. Aby poprawnie zadziałały,
konieczne jest m. in. wcześniejsze ściągnięcie i umieszczenie w odpowiednich
katalogach plików programów do zainstalowania. Poczytaj:

- [Narzędzia programistyczne](stretch/dev/index.md)
- [Narzędzia edukacyjne](stretch/edu/index.md)

## Tworzenie kont użytkowników

Przejdź do katalogu `lib`, wpisz nazwy kont użytkowników do skryptu `mkusers.sh`
i uruchom go, np.:

```bash
cd ../lib
./mkusers.sh
```
