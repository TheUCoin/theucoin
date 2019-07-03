
Debian
====================
This directory contains files used to package theucoind/theucoin-qt
for Debian-based Linux systems. If you compile theucoind/theucoin-qt yourself, there are some useful files here.

## theucoin: URI support ##


theucoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install theucoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your theucoinqt binary to `/usr/bin`
and the `../../share/pixmaps/theucoin128.png` to `/usr/share/pixmaps`

theucoin-qt.protocol (KDE)

