# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Front of the window switcher in UKUI desktop environment."
HOMEPAGE="https://github.com/ukui/ukui-window-switch"
SRC_URI="https://github.com/ukui/ukui-window-switch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtcore
	dev-qt/qtx11extras
	kde-frameworks/kglobalaccel
	kde-frameworks/kwayland
	x11-libs/gsettings-qt
	x11-libs/libwnck:3
	"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 PREFIX=/usr
}

src_compile() {
	emake
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
