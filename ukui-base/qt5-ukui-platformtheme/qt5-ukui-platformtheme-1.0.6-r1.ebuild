# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="The UKUI platform theme for qt5 QPA."
HOMEPAGE="https://github.com/ukui/qt5-ukui-platformtheme"
SRC_URI="https://github.com/ukui/qt5-ukui-platformtheme/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-libs/glib
		dev-qt/qtchooser
		dev-qt/qtcore
		dev-qt/qtdbus
		dev-qt/qtmultimedia
		dev-qt/qtwidgets
		dev-qt/qtx11extras
		kde-frameworks/kwayland
		kde-frameworks/kwindowsystem
		virtual/pkgconfig
		x11-libs/gsettings-qt
		x11-libs/libxcb
		x11-libs/libXtst"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eqmake5
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}