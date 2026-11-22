# fluorine-artwork

Debian 13 Trixie | Hyprland 0.55+ | x86_64

> For the FluorineOS ISO image, see the main repository at
> [https://github.com/FluorineOS/fluorine](https://github.com/FluorineOS/fluorine).

This package installs the visual assets for FluorineOS 0.0.1: AMOLED SVG wallpapers,
Plymouth boot splash, fastfetch configuration, and Calamares installer branding.

## Package Contents

| Installed path | Description |
| --- | --- |
| `/usr/share/backgrounds/fluorineos/fluorine-void.svg` | 3840x2160 AMOLED wallpaper, octahedron wireframe |
| `/usr/share/backgrounds/fluorineos/fluorine-grid.svg` | 3840x2160 AMOLED wallpaper, technical reticle grid |
| `/etc/skel/.config/fastfetch/logo.txt` | Block ASCII emblem for fastfetch |
| `/etc/skel/.config/fastfetch/config.jsonc` | fastfetch configuration with FluorineOS branding |
| `/usr/share/plymouth/themes/fluorineos/fluorineos.plymouth` | Plymouth theme descriptor |
| `/usr/share/plymouth/themes/fluorineos/fluorineos.script` | Plymouth script-plugin boot splash |
| `/usr/share/calamares/branding/fluorineos/branding.desc` | Calamares branding descriptor |
| `/usr/share/calamares/branding/fluorineos/logo.svg` | Calamares product logo |
| `/usr/share/calamares/branding/fluorineos/icon.svg` | Calamares product icon |
| `/usr/share/calamares/branding/fluorineos/show.qml` | Calamares QML slideshow (3 slides) |
| `/usr/share/calamares/branding/fluorineos/stylesheet.qss` | Calamares Qt dark stylesheet |

## Install

```sh
sudo apt-get install fluorine-artwork
```

The package is distributed through the FluorineOS APT repository at
[https://github.com/FluorineOS/apt-repo](https://github.com/FluorineOS/apt-repo).

## Build

Requires `dpkg-dev` and `debhelper` on Debian 13 `amd64`.

```sh
git clone https://github.com/FluorineOS/fluorine-artwork.git
cd fluorine-artwork
dpkg-buildpackage -us -uc -b
dpkg-deb -c ../fluorine-artwork_0.0.1_all.deb
```

The built `.deb` is placed in the parent directory.

## License

Source: [https://github.com/FluorineOS/fluorine-artwork](https://github.com/FluorineOS/fluorine-artwork)
