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

DEPEND="x11-misc/lightdm[qt5]
		media-libs/imlib2
		dev-qt/qtx11extras
		x11-libs/libXtst
		x11-base/xorg-server
		dev-qt/qtcore
		dev-qt/qtgui
		dev-qt/qtsvg"
RDEPEND="x11-misc/lightdm[qt5]
		media-libs/imlib2
		dev-qt/qtx11extras
		x11-libs/libXtst"
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
