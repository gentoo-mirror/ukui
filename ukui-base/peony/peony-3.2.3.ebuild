# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="The File Manager Application of UKUI."
HOMEPAGE="https://github.com/ukui/peony"
SRC_URI="https://github.com/ukui/peony/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		app-text/poppler[qt5]
		dev-libs/glib
		dev-qt/qtcore
		dev-qt/qtx11extras
		gnome-base/gvfs
		kde-frameworks/kwindowsystem
		kde-frameworks/kwayland
		media-libs/libcanberra
		sys-fs/udisks
		x11-libs/gsettings-qt
		x11-libs/libnotify
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	eqmake5
}

src_compile() {
	emake "$@"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
