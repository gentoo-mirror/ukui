# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="An advanced menu for UKUI"
HOMEPAGE="https://github.com/ukui/ukui-menu"
SRC_URI="https://github.com/ukui/ukui-menu/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		app-i18n/uchardet
		dev-libs/glib
		dev-qt/qtcore
		dev-qt/qtdbus
		dev-qt/qtsvg
		dev-qt/qtx11extras
		kde-frameworks/kwindowsystem
		ukui-base/ukui-interface
		x11-libs/bamf
		x11-libs/gsettings-qt"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eqmake5
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
