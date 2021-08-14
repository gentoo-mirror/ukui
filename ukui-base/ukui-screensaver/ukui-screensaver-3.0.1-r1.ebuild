# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg cmake

DESCRIPTION="Screensaver for UKUI desktop environment"
HOMEPAGE="https://github.com/ukui/ukui-screensaver"
SRC_URI="https://github.com/ukui/ukui-screensaver/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/qtx11extras
		gnome-base/dconf
		x11-libs/gsettings-qt
		x11-libs/libXtst"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_IN_SOURCE_BUILD="yes"

src_prepare() {
	default
	cp /etc/pam.d/login ${S}/data/ukui-screensaver-qt
	mkdir build
	BUILD_DIR="${S}/build"
	cmake_src_prepare
}

src_configure() {
	cd build
	pwd
	cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
	S="${S}/build"
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
