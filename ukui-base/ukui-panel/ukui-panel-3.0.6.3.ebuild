# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg cmake

DESCRIPTION="The taskbar of UKUI"
HOMEPAGE="https://github.com/ukui/ukui-panel"
SRC_URI="https://github.com/ukui/ukui-panel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/qtdbus
		dev-qt/qtdeclarative
		dev-qt/qtgui
		dev-qt/qtscript
		dev-qt/qtsensors
		dev-qt/qtwidgets
		dev-qt/qtx11extras
		dev-libs/libdbusmenu-qt
		dev-libs/libqtxdg
		gnome-base/dconf
		kde-frameworks/kwindowsystem
		media-libs/alsa-lib
		sys-libs/libstatgrab
		x11-libs/gsettings-qt
		x11-libs/libxkbcommon
		x11-libs/libX11
		x11-libs/libXcomposite
		x11-libs/libXdamage
		x11-libs/libXrender
		x11-libs/xcb-util
		"
RDEPEND="${DEPEND}"

src_configure() {
	# qtwebkit is deprecated
	local mycmakeargs=(
		-DCALENDAR_PLUGIN=NO
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
