# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Kylin network monitor used in ubuntu-kylin operation system"
HOMEPAGE="https://github.com/ukui/kylin-nm"
SRC_URI="https://github.com/ukui/kylin-nm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtcore
	dev-qt/qtconcurrent
	dev-qt/qtgui
	dev-qt/qtnetwork
	dev-qt/qtx11extras
	dev-qt/qtdbus
	dev-qt/qtsvg
	dev-qt/qtscript
	kde-frameworks/kwindowsystem
	x11-libs/gsettings-qt
	"
RDEPEND="${DEPEND}
	net-misc/networkmanager
	"

src_prepare() {
	eqmake5
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
