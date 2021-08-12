# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="provide notification center and cutting board on sidebar"
HOMEPAGE="https://github.com/ukui/ukui-sidebar"
SRC_URI="https://github.com/ukui/ukui-sidebar/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

# depend pakages in ukui-extra
# USE="dvd"
# WIP
# USE="xinerama"

DEPEND="
		dev-libs/glib
		dev-qt/qtcore
		dev-qt/qtmultimedia
		dev-qt/qtsvg
		dev-qt/qtx11extras
		gnome-base/dconf
		kde-frameworks/kwindowsystem
		media-libs/gst-plugins-good
		media-plugins/gst-plugins-pulse
		x11-libs/gsettings-qt
		x11-libs/libX11
		x11-libs/libXinerama
		x11-libs/libXrandr
		x11-libs/libXtst
		x11-libs/libXcursor
		ukui-base/ukui-interface
		"
RDEPEND="${DEPEND}"
BDEPEND=""


src_configure() {
	qmake PREFIX=/usr
}

src_compile() {
	emake
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
