# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Set of extensions for Peony, the UKUI file manager."
HOMEPAGE="https://github.com/ukui/peony-extensions"
SRC_URI="https://github.com/ukui/peony-extensions/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-text/poppler[qt5]
	dev-qt/qtcore
	dev-qt/qtimageformats
	ukui-base/peony
	x11-libs/gsettings-qt
	x11-libs/libnotify
	x11-terms/mate-terminal
	sys-fs/udisks
	net-fs/samba
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
