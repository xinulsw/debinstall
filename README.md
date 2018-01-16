# Debian

Skrypty dostosowujące instalację Debiana

## Wspierana wersja

Debian Stretch (9), amd64

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
2. Ustawienia domyślne, które można (czasem trzeba) dostosować:
..- debian000 – nazwa komputera,
..- szkola.org – nazwa domeny,
..- linuser – nazwa użytkownika,
..- xzsawq21 – hasło roota i uzytkownika,
..- /dev/sda – wybranie pierwszego dysku do instalacji menedżera GRUB.
3. Modyfikujemy polecenia uruchamiające instalator tak aby uwzględniały plik odpowiedzi.

## Użycie

Po sklonowaniu repozytorium za pomocą polecenia:

```bash
git clone https://github.com/xinulsw/debian.git
```

– należy przejrzeć i dostosować zawartość skryptów z poszczególnych katalogów.

cdn.
