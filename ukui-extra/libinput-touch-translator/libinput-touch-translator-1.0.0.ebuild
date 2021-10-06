# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Map actions in touch screen and touchpad to keyboard shortcuts"
HOMEPAGE="https://github.com/ukui/libinput-touch-translator"
SRC_URI="https://github.com/ukui/libinput-touch-translator/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

DEPEND="
	dev-qt/qtcore
	dev-qt/qtgui
	kde-frameworks/kxmlgui
	"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5
}

src_compile() {
	emake
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
