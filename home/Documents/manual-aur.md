# Instalar paquetes en forma manual del AUR
## GIT = si voy a mantener actualizado el paquete
## tar.gz = si no voy a actualizar mas el paquete
# Nunca usar sudo makepkg
```bash
mkdir -p ~/AUR
cd ~/AUR

curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/paquete.tar.gz
tar -xf paquete.tar.gz
rm paquete.tar.gz

cd paquete
makepkg --syncdeps --rmdeps --clean --install --cleanbuild --needed --log
```

-s → instala dependencias
-i → instala el paquete resultante
-c es opcional: limpia archivos temporales después del build. Yo lo uso solo cuando ya sé que el paquete compila bien.
-r → Remove: elimina dependencias instaladas automáticamente que ya no sean necesarias después del build.
--needed: Evita reinstalar dependencias ya instaladas

# Revisar el PKGBUILD
```bash
less PKGBUILD
```
## Buscá:
+ `source=() → de dónde baja cosas`
+ `prepare() / build() / package()`
+ `comandos raros tipo curl | sh ❌`
Esto es clave en AUR.

# Actualizar paquetes AUR
Para paquetes que vas a actualizar seguido:
No borrar las carpetas de los paquetes descargados con git
```bash
cd ~/AUR/
git clone https://aur.archlinux.org/paquete.git
cd paquete
makepkg --syncdeps --rmdeps --clean --install --cleanbuild --needed --log
```
## Después (para actualizar el paquete):
```bash
cd ~/AUR/paquete
git pull
makepkg -sric --needed --log
```
# Sin --cleanbuild.
## Ventajas:
+ Reutiliza src/.
+ Más rápido.
+ Sigue siendo limpio (porque usás -c y -r).

# Update “full clean” (cuando conviene)
## Usar tu comando completo cuando:
+ Cambia versión upstream.
+ Cambian parches.
+ Cambia toolchain (gcc, glibc, mesa…).
+ Falló un build previo.
+ PKGBUILD cambió fuerte.
```bash
git pull
makepkg -sric --cleanbuild --needed --log
```
