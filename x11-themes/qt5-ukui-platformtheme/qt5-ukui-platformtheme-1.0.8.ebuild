# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg qmake-utils

DESCRIPTION="The UKUI platform theme for qt5 QPA."
HOMEPAGE="https://github.com/ukui/qt5-ukui-platformtheme"
SRC_URI="https://github.com/ukui/qt5-ukui-platformtheme/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
DEPEND="
	dev-qt/qtconcurrent
	dev-qt/qtx11extras
	kde-frameworks/kwayland
	kde-frameworks/kwindowsystem
	x11-libs/gsettings-qt
	"
RDEPEND="${DEPEND}"
RESTRICT="!test? ( test )"
src_prepare() {
	eqmake5
	default
	if ! use test; then
		sed -i 's/test//g' "${S}/qt5-ukui.pro"
	fi
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
