# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg qmake-utils

DESCRIPTION="UKUI System Monitor"
HOMEPAGE="https://github.com/ukui/ukui-system-monitor"
SRC_URI="https://github.com/ukui/ukui-system-monitor/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+systemd"

DEPEND="
	dev-libs/glib
	dev-qt/qtcharts
	dev-qt/qtcore
	dev-qt/qtscript
	dev-qt/qtsvg
	dev-qt/qtx11extras
	gnome-base/libgtop
	kde-frameworks/kwindowsystem
	net-libs/libpcap
	x11-libs/gsettings-qt
	ukui-base/ukui-interface
	systemd? ( sys-apps/systemd )
	"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/HeaderMissing.patch"
)

src_prepare() {
	eqmake5
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
