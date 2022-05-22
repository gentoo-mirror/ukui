# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg qmake-utils

DESCRIPTION="media tools for UKUI"
HOMEPAGE="https://github.com/ukui/ukui-control-center"
SRC_URI="https://github.com/ukui/ukui-control-center/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libpwquality
	dev-libs/libxml2
	app-misc/ddcutil
	dev-qt/qtsvg
	dev-qt/qtwidgets
	dev-qt/qtx11extras
	dev-qt/qtmultimedia
	gnome-base/dconf
	kde-frameworks/bluez-qt
	kde-frameworks/kconfig
	kde-frameworks/kconfigwidgets
	kde-frameworks/kdeclarative
	kde-plasma/libkscreen
	mate-base/libmatekbd
	mate-base/mate-desktop
	media-libs/libcanberra
	media-libs/libmatemixer
	media-sound/pulseaudio
	virtual/libcrypt
	x11-libs/gsettings-qt
	"
RDEPEND="${DEPEND}
	dev-qt/qtgraphicaleffects
	ukui-base/ukui-power-manager
	ukui-base/ukui-session-manager
	ukui-base/ukui-screensaver
	ukui-base/ukui-settings-daemon
	x11-misc/redshift
	sys-apps/edid-decode
	"

src_prepare() {
	eqmake5 PREFIX=/usr
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
