# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Front of the window switcher in UKUI desktop environment."
HOMEPAGE="https://github.com/ukui/ukui-window-switch"
SRC_URI="https://github.com/ukui/ukui-window-switch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/qtcore
		dev-qt/qtx11extras
		x11-libs/gsettings-qt
		x11-libs/gtk+:3
		x11-libs/libwnck:3
		"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/cLinkage.patch"
)

src_configure() {
	qmake PREFIX=/usr
}

src_compile() {
	emake
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
