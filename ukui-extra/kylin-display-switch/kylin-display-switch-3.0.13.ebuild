# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="gui display output swtich tool"
HOMEPAGE="https://github.com/ukui/kylin-display-switch"
SRC_URI="https://github.com/ukui/kylin-display-switch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtcore
	kde-frameworks/kwindowsystem
	kde-plasma/kscreen
	x11-libs/gsettings-qt
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
