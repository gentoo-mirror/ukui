# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils gnome2-utils xdg

DESCRIPTION="provide notification center and cutting board on sidebar"
HOMEPAGE="https://github.com/ukui/ukui-sidebar"
SRC_URI="https://github.com/ukui/ukui-sidebar/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/glib
	dev-libs/libqtxdg
	dev-qt/qtcore
	dev-qt/qtconcurrent
	dev-qt/qtgui
	dev-qt/qtmultimedia
	dev-qt/qtprintsupport
	dev-qt/qtsql
	dev-qt/qtsvg
	dev-qt/qtx11extras
	gnome-base/dconf
	kde-frameworks/kwindowsystem
	x11-libs/gsettings-qt
	x11-libs/libXinerama
	ukui-base/ukui-interface
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	eqmake5 PREFIX=/usr
}

src_compile() {
	emake
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
