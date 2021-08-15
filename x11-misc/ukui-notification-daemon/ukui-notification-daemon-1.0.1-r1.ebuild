# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils qmake-utils

DESCRIPTION="UKUI Notification daemon"
HOMEPAGE="https://github.com/ukui/ukui-notification-daemon"
SRC_URI="https://github.com/ukui/ukui-notification-daemon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-libs/glib
		dev-qt/qtcore
		dev-qt/qtsvg
		gnome-base/dconf
		x11-libs/gsettings-qt
		x11-libs/libX11
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eqmake5
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
