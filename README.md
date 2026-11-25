# fluorine-artwork

Debian 13 Trixie | Hyprland 0.55+ | x86_64

> **Looking for the FluorineOS ISO?** Official installation images are published in the
> main repository:
> [FluorineOS/fluorine Releases](https://github.com/FluorineOS/fluorine/releases/latest).

This package installs the visual assets and toolkit defaults for FluorineOS: AMOLED SVG
wallpapers, four rendered 4K PNG wallpapers, the Plymouth boot splash, the GRUB2 boot menu
theme, fastfetch configuration, Calamares installer branding, and dark GTK, Qt, and
gsettings defaults.

## Package Contents

| Installed path | Description |
| --- | --- |
| `/usr/share/backgrounds/fluorineos/fluorine-void.svg` | 3840x2160 AMOLED wallpaper, octahedron wireframe |
| `/usr/share/backgrounds/fluorineos/fluorine-grid.svg` | 3840x2160 AMOLED wallpaper, technical reticle grid |
| `/usr/share/backgrounds/fluorine/fluorine-grid.png` | 3840x2160 lossless wallpaper, architectural hairline grid (default) |
| `/usr/share/backgrounds/fluorine/fluorine-hex.png` | 3840x2160 lossless wallpaper, hexagonal F emblem |
| `/usr/share/backgrounds/fluorine/fluorine-topo.png` | 3840x2160 lossless wallpaper, topographic contours with one lime ridge |
| `/usr/share/backgrounds/fluorine/fluorine-void.png` | 3840x2160 lossless wallpaper, solid void canvas |
| `/etc/skel/.config/fastfetch/logo.txt` | Block ASCII emblem for fastfetch |
| `/etc/skel/.config/fastfetch/config.jsonc` | fastfetch configuration with FluorineOS branding |
| `/etc/skel/.config/gtk-3.0/settings.ini` | GTK 3 dark settings, Adwaita theme, 24px cursor |
| `/etc/skel/.config/gtk-3.0/gtk.css` | AMOLED Void surfaces and lime accent for GTK 3 |
| `/etc/skel/.config/gtk-4.0/settings.ini` | GTK 4 dark settings, Adwaita theme, 24px cursor |
| `/etc/skel/.config/gtk-4.0/gtk.css` | AMOLED Void surfaces and lime accent for GTK 4 |
| `/etc/skel/.config/qt6ct/qt6ct.conf` | Qt 6 Fusion style bound to the FluorineOS palette |
| `/etc/skel/.config/qt5ct/qt5ct.conf` | Qt 5 Fusion style bound to the same palette |
| `/etc/skel/.config/zathura/zathurarc` | Recolored dark PDF viewing with lime highlights |
| `/etc/skel/.config/swayimg/config` | Black image viewer window with bicubic scaling |
| `/usr/share/fluorineos/qt/colors/fluorine.conf` | Shared qt5ct and qt6ct palette |
| `/etc/fonts/conf.d/50-fluorineos-alias.conf` | Resolves Space Grotesk to the packaged Inter family |
| `/etc/dconf/profile/user` | dconf profile reading the local system database |
| `/etc/dconf/db/local.d/00-fluorine-appearance` | Dark scheme, icon theme, cursor, and font keys |
| `/usr/share/plymouth/themes/fluorine/fluorine.plymouth` | Plymouth theme descriptor, registered as the default in `postinst` |
| `/usr/share/plymouth/themes/fluorine/fluorine.script` | Plymouth script-plugin boot splash |
| `/usr/share/plymouth/themes/fluorine/emblem.png` | Hexagonal F boot emblem, lime on transparent |
| `/usr/share/grub/themes/fluorine/theme.txt` | GRUB2 boot menu theme, staged under `/boot/grub/themes` |
| `/usr/share/grub/themes/fluorine/item_*.png`, `sel_*.png` | 9-slice entry panels and lime selected frame |
| `/usr/share/calamares/branding/fluorineos/branding.desc` | Calamares branding descriptor |
| `/usr/share/calamares/branding/fluorineos/logo.svg` | Calamares product logo |
| `/usr/share/calamares/branding/fluorineos/icon.svg` | Calamares product icon |
| `/usr/share/calamares/branding/fluorineos/show.qml` | Calamares QML slideshow (3 slides) |
| `/usr/share/calamares/branding/fluorineos/stylesheet.qss` | Calamares Qt dark stylesheet |

## Toolkit Defaults

GTK 3 and GTK 4 read the `settings.ini` files above, which select Adwaita, the dark
variant, a 24px cursor, and Space Grotesk at 11pt. Space Grotesk is not packaged in
Debian 13, so the fontconfig alias resolves it to Inter; JetBrains Mono is packaged and
used directly. The paired `gtk.css` files replace the
Adwaita accent with lime `#b4f03a`, set surfaces to `#000000` and `#0a0d10`, and use deep
moss `#2a3812` for selection.

Qt applications use the Fusion style with the shared palette. `fluorine-desktop` exports
`QT_QPA_PLATFORMTHEME=qt6ct` and `ELECTRON_OZONE_PLATFORM_HINT=auto` from the Hyprland
session, so Qt 6 and Electron clients render through the Wayland backend with the same
surfaces. Qt 5 applications honor the same palette when launched with `qt5ct`.

GNOME-based surfaces read the dconf system database, which sets `color-scheme` to
`prefer-dark` and matches the same theme, icon, cursor, and font choices. `debian/postinst`
runs `dconf update` when `dconf-cli` is installed, so the defaults apply system wide.

Zathura reads `~/.config/zathura/zathurarc`, which enables recoloring instead of inverting:
page backgrounds become `#000000`, ink becomes `#e2e8f0`, and search hits plus the current
selection use lime `#b4f03a` against a `#0a0d10` status bar. swayimg reads
`~/.config/swayimg/config` for a black viewer window, fit-to-window scaling, and bicubic
resampling; switch `antialiasing` to `nearest` there when pixel art must stay exact.

Hyprland announces every output with `preferred` mode, automatic placement, and scale 1.
Fractional scale values of 1.25 and 1.5 are documented as commented examples in
`~/.config/hypr/hyprland.lua`, alongside `xwayland { force_zero_scaling = true }` so
legacy X11 clients stay pixel-crisp on scaled panels.

## Install

```sh
sudo apt-get install fluorine-artwork
```

The package is distributed through the FluorineOS APT repository at
[https://github.com/FluorineOS/apt-repo](https://github.com/FluorineOS/apt-repo).

## Build

Requires `dpkg-dev`, `debhelper`, and `librsvg2-bin` on Debian 13 `amd64`.

```sh
git clone https://github.com/FluorineOS/fluorine-artwork.git
cd fluorine-artwork
dpkg-buildpackage -us -uc -b
dpkg-deb -c ../fluorine-artwork_0.5.0_all.deb
```

The built `.deb` is placed in the parent directory.

The four 4K wallpapers are not stored in git. `wallpapers/*.svg` holds the vector sources
and `tools/generate-wallpapers.sh` renders them to `wallpapers/out/` at build time through
`rsvg-convert`, which `debian/rules` calls before packaging. Rendering the same sources
twice produces byte-identical PNGs, so a rebuild of the same commit ships the same images.

## License

Released under the MIT License. See [LICENSE](LICENSE) for the full text.

Source: [FluorineOS/fluorine-artwork](https://github.com/FluorineOS/fluorine-artwork)
