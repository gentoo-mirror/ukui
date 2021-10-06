# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils cmake

DESCRIPTION="Session manager of the UKUI desktop environment"
HOMEPAGE="https://github.com/ukui/ukui-session-manager"
SRC_URI="https://github.com/ukui/ukui-session-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/qtcore
		dev-qt/qtdbus
		dev-qt/qtmultimedia
		dev-qt/qtwidgets
		dev-qt/qtx11extras
		kde-frameworks/kidletime
		x11-libs/gsettings-qt
		x11-libs/libX11
		x11-libs/libxcb
		x11-libs/libXtst
		x11-misc/xdg-user-dirs"
RDEPEND="${DEPEND}
		x11-themes/ukui-themes"
BDEPEND=""

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
