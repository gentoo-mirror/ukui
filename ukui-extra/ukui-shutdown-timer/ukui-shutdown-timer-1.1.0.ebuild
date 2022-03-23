# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils xdg qmake-utils

DESCRIPTION="time-shutdown"
HOMEPAGE="https://github.com/ukui/ukui-shutdown-timer"
SRC_URI="https://github.com/ukui/ukui-shutdown-timer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/glib
	dev-qt/qtcore
	dev-qt/qtsvg
	x11-libs/gsettings-qt
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eqmake5 PREFIX=/usr
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
