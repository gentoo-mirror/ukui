# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg-utils

DESCRIPTION="The greeter for UKUI."
HOMEPAGE="https://github.com/ukui/ukui-greeter"
SRC_URI="https://github.com/ukui/ukui-greeter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/qtcore
		dev-qt/qtgui
		dev-qt/qtx11extras
		dev-qt/qtsvg
		dev-qt/qtwidgets
		media-libs/imlib2
		x11-base/xorg-server
		x11-libs/libX11
		x11-libs/libXrandr
		x11-libs/libXtst
		x11-misc/lightdm[qt5]
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eqmake5
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
