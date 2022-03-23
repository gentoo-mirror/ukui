# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="The greeter for UKUI."
HOMEPAGE="https://github.com/ukui/ukui-greeter"
SRC_URI="https://github.com/ukui/ukui-greeter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="
	dev-qt/qtcore
	dev-qt/qtdbus
	dev-qt/qtwidgets
	dev-qt/qtsvg
	dev-qt/qtx11extras
	media-libs/opencv
	media-libs/imlib2
	x11-base/xorg-server
	x11-apps/xrandr
	x11-misc/lightdm[qt5]
	"
DEPEND="dev-qt/linguist-tools
	${CDEPEND}"
RDEPEND="${CDEPEND}"

src_prepare() {
	eqmake5
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
