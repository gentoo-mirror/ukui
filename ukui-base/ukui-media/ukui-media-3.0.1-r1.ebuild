# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils qmake-utils

DESCRIPTION="media tools for UKUI"
HOMEPAGE="https://github.com/ukui/ukui-media"
SRC_URI="https://github.com/ukui/ukui-media/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-libs/glib
		dev-libs/libxml2
		dev-qt/qtmultimedia
		dev-qt/qtsvg
		dev-util/intltool
		kde-frameworks/kwindowsystem
		mate-base/mate-common
		mate-base/mate-desktop
		media-libs/libcanberra
		media-libs/libmatemixer
		x11-libs/gsettings-qt
		x11-libs/gtk+:3"
RDEPEND="ukui-base/ukui-interface"
BDEPEND=""

src_prepare() {
	NOCONFIGURE=1 ./autogen.sh || die
	default
}

src_configure() {
	econf --prefix="/usr" --libexecdir="/usr/lib/${PN}"  --sysconfdir="/etc"
	cd ukui-volume-control-applet-qt
	qmake PREFIX="/usr/share/${PN}"
}
src_compile(){
	emake "$@"
	cd ukui-volume-control-applet-qt
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	cd ukui-volume-control-applet-qt
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
