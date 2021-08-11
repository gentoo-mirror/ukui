# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="Daemon in the UKUI desktop environment"
HOMEPAGE="https://github.com/ukui/ukui-settings-daemon"
SRC_URI="https://github.com/ukui/ukui-settings-daemon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		app-misc/geoclue
		dev-libs/libgudev
		dev-libs/wayland
		dev-qt/qtcore
		dev-qt/qtchooser
		dev-qt/qtsensors
		dev-qt/qtsvg
		dev-qt/qtx11extras
		dev-util/intltool
		gnome-base/gnome-desktop
		kde-frameworks/kconfig
		mate-base/libmatekbd
		mate-base/mate-desktop
		media-libs/libcanberra[gtk,gtk3]
		media-libs/lcms
		media-libs/libmatemixer
		media-libs/imlib2
		media-sound/pulseaudio
		x11-base/xorg-server
		x11-misc/colord
		x11-libs/gsettings-qt
		x11-libs/libnotify
		x11-libs/libwnck:3
		x11-libs/libxklavier
		x11-libs/libXtst
		"
RDEPEND="
		x11-misc/imwheel
		mate-base/mate-common
		ukui-base/ukui-biometric-auth
		x11-base/xorg-drivers[input_devices_synaptics]
		dev-libs/glib
		"
BDEPEND=""

src_prepare() {
	eqmake5
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}